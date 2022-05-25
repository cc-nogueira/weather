import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latinize/latinize.dart';

import '../../../l10n/translations.dart';

typedef CityCallback = void Function(City city);

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

class _CitySearch extends ConsumerWidget {
  _CitySearch({
    required this.cityProvider,
    required this.onCitySelected,
    List<City>? currentCities,
  }) : currentCitiesKeys = currentCities == null
            ? {}
            : currentCities.map((each) => each.alphabeticalOrderByCountryKey).toSet();

  final StateProvider<City> cityProvider;
  final CityCallback onCitySelected;
  final Set<String> currentCitiesKeys;

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

  Widget _loading() => const Center(
        child: SizedBox(height: 100, width: 100, child: CircularProgressIndicator()),
      );

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

  Widget _noResults(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(Translations.of(context)!.no_matches_found_message, style: textTheme.titleMedium);
  }

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
              child: Text(translations.add_label),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: colors.onPrimary,
                primary: colors.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () => onCitySelected(city),
              child: Text(translations.add_label),
            ),
    );
  }

  bool _alreadyContains(City city) =>
      currentCitiesKeys.contains(city.alphabeticalOrderByCountryKey);

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

  Widget _showError(BuildContext context, Object error) {
    final msg =
        error is ArgumentError ? error.message : Translations.of(context)!.error_searching_message;
    final textTheme = Theme.of(context).textTheme;
    return Text(msg, style: textTheme.headline6!.copyWith(color: Colors.red));
  }
}
