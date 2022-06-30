import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latinize/latinize.dart';

import '../../../l10n/translations.dart';

typedef CityCallback = void Function(City city);

/// City search widget.
///
/// This "parent" widget loads the current list of user cities and forward this list along other
/// constructor argumenta to the internal city search widget.
class CitySearch extends ConsumerWidget {
  const CitySearch({super.key, required this.cityProvider, required this.onCitySelected});

  final StateProvider<City> cityProvider;
  final CityCallback onCitySelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(watchAllCitiesProvider).when(
          loading: () => _CitySearch(
            cityProvider: cityProvider,
            onCitySelected: onCitySelected,
          ),
          error: (_, __) => Container(),
          data: (data) => _CitySearch(
            cityProvider: cityProvider,
            onCitySelected: onCitySelected,
            currentCities: data,
          ),
        );
  }
}

/// Internal city search widget.
///
/// This widget watchs a city provider to execute a remote search and show results.
/// It uses the already registered list of cities to prevent doubled cities.
class _CitySearch extends ConsumerWidget {
  /// Constructor.
  _CitySearch({required this.cityProvider, required this.onCitySelected, List<City>? currentCities})
      : _currentCitiesKeys = currentCities == null
            ? {}
            : currentCities.map((each) => each.alphabeticalOrderByCountryKey).toSet();

  /// City to be searched provider.
  ///
  /// This provider is watched to trigger new searchs.
  final StateProvider<City> cityProvider;

  /// Callback when a city is selected to be added to the user's list.
  final CityCallback onCitySelected;

  /// Internal set of already registered cities.
  final Set<String> _currentCitiesKeys;

  /// Build method watches the city provider and triggers searching when it changes.
  /// Search results are displayed as a list for matches with and Add button for each.
  /// If a result is already included in the user's list this button will reflect this state.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityProvider);
    if (city.name.isEmpty) {
      return const SizedBox();
    }
    return ref.watch(citiesSearchProvider(city)).when(
          loading: _loading,
          data: (data) => _showResults(context, data),
          error: (error, _) => _showError(context, error),
        );
  }

  /// Internal - show a circular progress indicator when a fresh search is executing.
  /// As is the "new" standard for Riverpod, only the first search show the loading state, and new
  /// searchs will display the old result until the new data comes in.
  Widget _loading() => const Center(
        child: SizedBox(height: 100, width: 100, child: CircularProgressIndicator()),
      );

  /// Internal - show search results in a list view.
  ///
  /// Each result is displayed as a tile with city information and a Add button.
  /// If a result is already included in the user's list this button will reflect this state.
  Widget _showResults(BuildContext context, List<City> results) {
    final translations = Translations.of(context)!;
    final locale = Localizations.localeOf(context);
    final colors = Theme.of(context).colorScheme;
    return results.isEmpty
        ? _noResults(context)
        : ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
            itemBuilder: (_, idx) => _itemBuilder(
              context,
              translations,
              locale,
              colors,
              results[idx],
            ),
          );
  }

  /// Internal - when no matches are found displays a text message.
  Widget _noResults(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(Translations.of(context)!.no_matches_found_message, style: textTheme.titleMedium);
  }

  /// Internal - builder for each matching result.
  ///
  /// Displays a tile with city information and a Add button.
  ///
  /// Presents the city name according to the current language and its official name.
  /// Also displays city's state and country.
  /// After the information displays a trailling Add button.
  /// If a result is already included in the user's list this button will reflect this state.
  Widget _itemBuilder(BuildContext context, Translations translations, Locale locale,
      ColorScheme colors, City city) {
    final localName = city.translation(locale.languageCode);
    final same = latinize(localName.toLowerCase()) == latinize(city.name.toLowerCase());
    final showName = same ? localName : '$localName (${city.name})';
    final subtitle = city.state.isEmpty ? city.country : '${city.state}, ${city.country}';
    return ListTile(
      title: Text(showName),
      subtitle: Text(subtitle),
      trailing: _alreadyContains(city)
          ? OutlinedButton(
              onPressed: () => _onCityAlreadyExistis(context, translations, showName),
              child: Text(translations.add_label,
                  semanticsLabel: translations.message_city_already_in_your_list(showName)),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: colors.onPrimary,
                primary: colors.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () => onCitySelected(city),
              child: Text(translations.add_label,
                  semanticsLabel: translations.message_add_city_to_your_list(showName)),
            ),
    );
  }

  /// Internal - check if this city is already registered in the user's list.
  bool _alreadyContains(City city) =>
      _currentCitiesKeys.contains(city.alphabeticalOrderByCountryKey);

  /// Internal - handler to dlisplay a message when the Add button is tapped for a already existing city.
  void _onCityAlreadyExistis(BuildContext context, Translations translations, String showName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(translations.title_city_already_in_your_list),
          content: Text(translations.message_city_already_in_your_list(showName)),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
          ],
          elevation: 5,
        );
      },
    );
  }

  /// Internal - handler to show a error message that had occurred when searching.
  Widget _showError(BuildContext context, Object error) {
    final msg =
        error is ArgumentError ? error.message : Translations.of(context)!.error_searching_message;
    final textTheme = Theme.of(context).textTheme;
    return Text(msg, style: textTheme.headline6!.copyWith(color: Colors.red));
  }
}
