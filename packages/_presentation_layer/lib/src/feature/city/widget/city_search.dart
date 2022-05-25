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
    return results.isEmpty
        ? _noResults(context)
        : ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
            itemBuilder: (_, idx) => _itemBuilder(translations, locale, results[idx]),
          );
  }

  Widget _noResults(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(Translations.of(context)!.no_matches_found_message, style: textTheme.titleMedium);
  }

  Widget _itemBuilder(Translations translations, Locale locale, City city) {
    final localName = city.translation(locale.languageCode);
    final same = latinize(localName.toLowerCase()) == latinize(city.name.toLowerCase());
    final showName = same ? localName : '$localName (${city.name})';
    final subtitle = city.state.isEmpty ? city.country : '${city.state}, ${city.country}';
    return ListTile(
      title: Text(showName),
      subtitle: Text(subtitle),
      trailing: OutlinedButton(
        onPressed: () => onCitySelected(city),
        child: Text(translations.add_label),
      ),
    );
  }

  Widget _showError(BuildContext context, Object error) {
    final msg =
        error is ArgumentError ? error.message : Translations.of(context)!.error_searching_message;
    final textTheme = Theme.of(context).textTheme;
    return Text(msg, style: textTheme.headline6!.copyWith(color: Colors.red));
  }
}
