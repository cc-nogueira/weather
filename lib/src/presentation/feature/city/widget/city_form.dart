import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain_layer.dart';
import '../../../l10n/translations.dart';

/// City form to fill the search data.
///
/// This form has a mandatory City name field and an optional country selector field.
/// Data is uptaded in the given city StateProvider.
///
/// This widget will probably sit inside a Flutter Form widget to coordinate validation.
/// Fields are configured with internationalized labels and validation messages.
class CityForm extends ConsumerWidget {
  /// Const constructor. The positional argument is the city provider that is updated in sync with
  /// field values.
  const CityForm(
    this.cityProvider, {
    super.key,
    required this.onCountryChanged,
    required this.onCityNameCleared,
  });

  /// City state provider that is updated with field value changes.
  final StateProvider<City> cityProvider;

  /// Callback when the country changes (that may trigger a form complete event for this widget parent).
  final VoidCallback onCountryChanged;

  /// Callback to be called when the city name is cleared (that may trigger results clearing in the parent).
  final VoidCallback onCityNameCleared;

  /// Builds the internal [_CityForm] providing the state controller to sync with field values.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context)!;
    final controller = ref.watch(cityProvider.notifier);
    return _CityForm(tr, controller, onCountryChanged, onCityNameCleared);
  }
}

/// Internal statefull widget to controll form fields.
///
/// It is responsibility of this class to keep the state controller in sync with fields and to
/// invoke onCountryChanged and onCityNameCleared callbacks as appropriate.
class _CityForm extends StatefulWidget {
  /// Const constructor.
  const _CityForm(
    this.tr,
    this.cityController,
    this.onCountryChanged,
    this.onCityNameCleared,
  );

  /// Translations for field labels and messages.
  final Translations tr;

  /// City state controller to keep field values in sync with form's city state.
  final StateController<City> cityController;

  /// Callback when the country changes (that may trigger a form complete event for this widget parent).
  final VoidCallback onCountryChanged;

  /// Callback to be called when the city name is cleared (that may trigger results clearing in the parent).
  final VoidCallback onCityNameCleared;

  @override
  State<_CityForm> createState() => _CityFormState();

  /// Getter for the controller's city.
  City get city => cityController.state;

  /// Setter for the controller's city.
  set city(City city) => cityController.state = city;
}

/// Internal - State class with form fields.
///
/// Class that manage statefull fields keeping them in sync with parent's city state controller.
class _CityFormState extends State<_CityForm> {
  /// City name text editing controller.
  late final TextEditingController cityTextController;

  /// Country code text editing controller.
  ///
  /// This field is read only, changes are maneged by the country picker component.
  late final TextEditingController countryTextController;

  /// City focus node.
  late final FocusNode cityFocus;

  /// Country focus node.
  late final FocusNode countryFocus;

  /// Init state by creating TextEditing controllers and FocusNodes.
  @override
  void initState() {
    super.initState();
    cityTextController = TextEditingController(text: widget.city.name);
    countryTextController = TextEditingController(text: widget.city.country);
    cityFocus = FocusNode();
    countryFocus = FocusNode();
  }

  /// Dispose handler to dispose local resources.
  @override
  void dispose() {
    cityTextController.dispose();
    countryTextController.dispose();
    cityFocus.dispose();
    countryFocus.dispose();
    super.dispose();
  }

  /// Build city fields form.
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: _fields(context),
      );

  /// Internal - create form fields.
  ///
  /// This form has a field for City name and for Country code.
  /// Country code field is read only, changes are maneged by the country picker component.
  Widget _fields(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _formField(
            context,
            widget.tr.city_label,
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
            widget.tr.country_label,
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

  /// Internal - handle city name or country changes.
  ///
  /// Updates the city state controller.
  /// Invokes onCityNameCleared callback when city name is empty.
  void _onFormChanged() => setState(() {
        widget.city = City(name: cityTextController.text, country: countryTextController.text);
        if (widget.city.name.isEmpty) {
          widget.onCityNameCleared();
        }
      });

  /// Internal - handle country picker selection.
  ///
  /// Updates the readonly country field, invoke _onFormChanged handler.
  /// Invokes onCountryChanged callback.
  void _onCountryChanged(Country country, TextEditingController controller) {
    controller.text = country.countryCode;
    _onFormChanged();
    widget.onCountryChanged();
  }

  /// Internal - City name validation.
  ///
  /// City name is a required field.
  String? _validateCity(String? text) => text == null || text.isEmpty ? '* ${widget.tr.required_label}' : null;

  /// Internal - Helper function to create form fields.
  ///
  /// Creates a text form field with common decorations and event handlers.
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
                  tooltip: widget.tr.message_clear_input,
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
        onEditingComplete: nextFocus == null ? null : () => _focusNext(context, focusNode, nextFocus),
        textInputAction: nextFocus == null ? TextInputAction.done : TextInputAction.next,
        textCapitalization: textCapitalization,
      );

  /// Internal - change input focus.
  void _focusNext(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
