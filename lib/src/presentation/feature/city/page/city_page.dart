import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain_layer.dart';
import '../../../l10n/translations.dart';
import '../widget/city_form.dart';
import '../widget/city_search.dart';

/// Add City page.
///
/// This is a page to search cities that can be added and persisted as selected cities for
/// weather viewing.
///
/// Presents a search form to enter the city name and optional country code.
/// Search occurs when a country is entered or the search button is tapped.
///
/// The list of matching cities will allow adding new localities to the users selection.
class CityPage extends ConsumerWidget {
  /// Constructor.
  CityPage({super.key});

  /// Internal - state provider for the city details being filled in this page form.
  final _formCityProvider = StateProvider((ref) => const City());

  /// Internal - state provider for the city details to be searched for.
  ///
  /// The search widget will watch this provider to execute remote city searching.
  /// It is update by [_onSearchPressed] and indirectly by [_onCountryChanged].
  final _searchCityProvider = StateProvider((ref) => const City());

  /// Internal - form key, used for validation.
  final _formKey = GlobalKey<FormState>();

  /// Build this page with a City form, a search button and a search results widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = Translations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(translations.add_city_page_title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _cityForm(context, ref),
          _searchButton(context, ref, translations),
          _citySearch(context, ref),
        ],
      ),
    );
  }

  /// Internal - creates the CityForm widget inside a flutter Form.
  Widget _cityForm(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: CityForm(
            _formCityProvider,
            onCountryChanged: () => _onCountryChanged(context, ref),
            onCityNameCleared: () => _onCityNameCleared(ref),
          ),
        ),
      );

  /// Internal - creates the CitySearch widget that searches and display matching results.
  Widget _citySearch(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: CitySearch(
          cityProvider: _searchCityProvider,
          onCitySelected: (city) => _onCitySelected(context, ref, city),
        ),
      );

  /// Internal - created the search button.
  Widget _searchButton(BuildContext context, WidgetRef ref, Translations translations) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: OutlinedButton(
          onPressed: () => _onSearchPressed(context, ref),
          child: Text(translations.search_label),
        ),
      );

  /// Internal - handles the event when the city name is cleared.
  ///
  /// This will result in updating the search city provider and the clearing of any search results.
  void _onCityNameCleared(WidgetRef ref) {
    final city = ref.read(_formCityProvider);
    ref.read(_searchCityProvider.notifier).state = city;
  }

  /// Internal - handle the event when a country is selected.
  ///
  /// If the form is fully filled it will trigger the search button event.
  void _onCountryChanged(BuildContext context, WidgetRef ref) {
    final city = ref.read(_formCityProvider);
    if (city.name.isNotEmpty && city.country.isNotEmpty) {
      _onSearchPressed(context, ref);
    }
  }

  /// Internal - Validate the form and update the city search provider
  /// that triggers search.
  void _onSearchPressed(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();

    final form = _formKey.currentState!;
    form.save();
    if (form.validate()) {
      final city = ref.read(_formCityProvider);
      ref.read(_searchCityProvider.notifier).state = city;
    }
  }

  /// Internal - Callback for the City search widget.
  ///
  /// This callback save the selected city to the users list and pops this page.
  void _onCitySelected(BuildContext context, WidgetRef ref, City city) {
    final usecase = ref.read(citiesUsecaseProvider);
    usecase.save(city);
    Navigator.pop(context);
  }
}
