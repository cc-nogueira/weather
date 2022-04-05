import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/city_form.dart';
import '../widget/city_search.dart';

class CityPage extends ConsumerWidget {
  CityPage({Key? key}) : super(key: key);
  final _formCityProvider = StateProvider((ref) => const City());
  final _searchCityProvider = StateProvider((ref) => const City());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('City')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _cityForm(context, ref.read),
            _searchButton(context, ref.read),
            _citySearch(context, ref.read),
          ],
        ),
      );

  Widget _cityForm(BuildContext context, Reader read) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: CityForm(
            _formCityProvider,
            onCountryChanged: () => _onCountryChanged(context, read),
          ),
        ),
      );

  Widget _citySearch(BuildContext context, Reader read) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: CitySearch(
          cityProvider: _searchCityProvider,
          onCitySelected: (city) => _onCitySelected(context, read, city),
        ),
      );

  Widget _searchButton(BuildContext context, Reader read) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: OutlinedButton(
            onPressed: () => _onSearchPressed(context, read),
            child: const Text('Search')),
      );

  void _onCountryChanged(BuildContext context, Reader read) {
    final city = read(_formCityProvider);
    if (city.name.isNotEmpty && city.country.isNotEmpty) {
      _onSearchPressed(context, read);
    }
  }

  void _onSearchPressed(BuildContext context, Reader read) {
    FocusScope.of(context).unfocus();

    final form = _formKey.currentState!;
    form.save();
    if (form.validate()) {
      final city = read(_formCityProvider);
      read(_searchCityProvider.notifier).state = city;
    }
  }

  void _onCitySelected(BuildContext context, Reader read, City city) {
    final usecase = read(citiesUsecaseProvider);
    usecase.save(city);
    Navigator.pop(context);
  }
}
