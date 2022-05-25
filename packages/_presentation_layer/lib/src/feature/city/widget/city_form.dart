import 'package:_domain_layer/domain_layer.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../l10n/translations.dart';

class CityForm extends ConsumerWidget {
  const CityForm(
    this.cityProvider, {
    super.key,
    required this.onCountryChanged,
  });

  final StateProvider<City> cityProvider;
  final VoidCallback onCountryChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = Translations.of(context)!;
    final controller = ref.watch(cityProvider.notifier);
    return _CityForm(translations, cityProvider, controller, onCountryChanged);
  }
}

class _CityForm extends StatefulWidget {
  const _CityForm(this.translations, this.cityProvider, this.cityController, this.onCountryChanged);

  final Translations translations;
  final StateProvider<City> cityProvider;
  final StateController<City> cityController;
  final VoidCallback onCountryChanged;

  @override
  State<_CityForm> createState() => _CityFormState();

  City get city => cityController.state;
  set city(City city) => cityController.state = city;
}

class _CityFormState extends State<_CityForm> {
  late final TextEditingController cityTextController;
  late final TextEditingController countryTextController;
  late final FocusNode cityFocus;
  late final FocusNode countryFocus;

  @override
  void initState() {
    super.initState();
    cityTextController = TextEditingController(text: widget.city.name);
    countryTextController = TextEditingController(text: widget.city.country);
    cityFocus = FocusNode();
    countryFocus = FocusNode();
  }

  @override
  void dispose() {
    cityTextController.dispose();
    countryTextController.dispose();
    cityFocus.dispose();
    countryFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: _fields(context),
      );

  Widget _fields(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _formField(
            context,
            widget.translations.city_label,
            cityTextController,
            validator: _validateCity,
            onChanged: (_) => _onFormChanged(),
            focusNode: cityFocus,
            nextFocus: countryFocus,
          ),
        ),
        const SizedBox(width: 4.0),
        SizedBox(
          width: 90,
          child: _formField(
            context,
            widget.translations.country_label,
            countryTextController,
            readOnly: true,
            onTap: () => showCountryPicker(
              context: context,
              searchAutofocus: true,
              onSelect: (country) => _onCountryChanged(country, countryTextController),
            ),
            focusNode: countryFocus,
            maxLength: 2,
            textCapitalization: TextCapitalization.characters,
          ),
        ),
        // SizedBox(width: 24, child: IconButton(onPressed: , icon: const Icon(Icons.clear))),
      ],
    );
  }

  void _onFormChanged() => setState(
        () =>
            widget.city = City(name: cityTextController.text, country: countryTextController.text),
      );

  void _onCountryChanged(Country country, TextEditingController controller) {
    controller.text = country.countryCode;
    _onFormChanged();
    widget.onCountryChanged();
  }

  String? _validateCity(String? text) =>
      text == null || text.isEmpty ? '* ${widget.translations.required_label}' : null;

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
          contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 12, right: 0.0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(5.0),
          ),
          label: Text(label),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    _onFormChanged();
                  },
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                ),
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
