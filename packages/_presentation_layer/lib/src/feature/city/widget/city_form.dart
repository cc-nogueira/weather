import 'package:_domain_layer/domain_layer.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CityForm extends ConsumerWidget {
  const CityForm(this.cityProvider, {super.key, required this.onCountryChanged});

  final StateProvider<City> cityProvider;
  final VoidCallback onCountryChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(cityProvider.notifier);
    return _CityForm(cityProvider, controller, onCountryChanged);
  }
}

class _CityForm extends HookConsumerWidget {
  const _CityForm(this.cityProvider, this.cityController, this.onCountryChanged);

  final StateProvider<City> cityProvider;
  final StateController<City> cityController;
  final VoidCallback onCountryChanged;

  City get city => cityController.state;
  set city(City city) => cityController.state = city;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(children: _fields(context, ref)),
      );

  List<Widget> _fields(BuildContext context, WidgetRef ref) {
    final cityFocus = useFocusNode();
    final countryFocus = useFocusNode();
    final countryTextController = useTextEditingController(text: city.country);
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _formField(
              context,
              'City',
              useTextEditingController(text: city.name),
              validator: _validateCity,
              onChanged: _onCityChanged,
              focusNode: cityFocus,
              nextFocus: countryFocus,
            ),
          ),
          const SizedBox(width: 4.0),
          SizedBox(
            width: 85,
            child: _formField(
              context,
              'Country',
              countryTextController,
              readOnly: true,
              onTap: () => showCountryPicker(
                context: context,
                searchAutofocus: true,
                onSelect: (country) => _onCountryChanged(country, countryTextController),
              ),
              validator: _validateCountry,
              focusNode: countryFocus,
              maxLength: 2,
              textCapitalization: TextCapitalization.characters,
            ),
          ),
        ],
      ),
    ];
  }

  void _onCityChanged(String text) => city = city.copyWith(name: text);
  void _onCountryChanged(Country country, TextEditingController controller) {
    city = city.copyWith(country: country.countryCode);
    controller.text = country.countryCode;
    onCountryChanged();
  }

  String? _validateCity(String? text) => text == null || text.isEmpty ? '* required' : null;

  String? _validateCountry(String? text) => text == null || text.length != 2 ? '* required' : null;

  Widget _formField(
    BuildContext context,
    String label,
    TextEditingController controller, {
    void Function(String)? onChanged,
    required FocusNode focusNode,
    FocusNode? nextFocus,
    String? Function(String?)? validator,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool readOnly = false,
    VoidCallback? onTap,
  }) =>
      TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(5.0),
          ),
          label: Text(label),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          counterText: '',
        ),
        maxLength: maxLength,
        onChanged: onChanged,
        validator: validator,
        focusNode: focusNode,
        onEditingComplete:
            nextFocus == null ? null : () => _focusNext(context, focusNode, nextFocus),
        textInputAction: nextFocus == null ? TextInputAction.done : TextInputAction.next,
        textCapitalization: textCapitalization,
      );

  void _focusNext(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
