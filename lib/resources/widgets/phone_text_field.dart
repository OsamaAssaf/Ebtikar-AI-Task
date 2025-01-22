import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';
import 'package:ebtikar_ai_task/resources/widgets/country_picker.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    this.controller,
    required this.selectedCountryFlag,
    required this.onSelect,
    this.textInputAction,
    this.focusNode,
    this.initialValue,
    this.label,
    this.backgroundColor,
    this.onChanged,
    this.validator,
  });

  final TextEditingController? controller;
  final String selectedCountryFlag;
  final void Function(Country) onSelect;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? label;
  final Color? backgroundColor;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller,
            initialValue: initialValue,
            autofillHints: const [
              AutofillHints.username,
            ],
            hint: '07 xxxx xxxx',

            // helperText: '07 xxxx xxxx',
            // helperTextDirection: TextDirection.ltr,
            label: label ?? localizations.phoneNumber,
            focusNode: focusNode,
            textInputType: TextInputType.phone,
            textInputAction: textInputAction ?? TextInputAction.next,
            prefixIcon: Icon(
              Icons.phone_android_rounded,
              color: theme.colorScheme.primary,
              size: ConstantsManager.iconSize,
            ),
            validator: validator ?? ValidatorsManager().validateAuthPhone,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 8.0),
        CountryPicker(
          selectedCountryFlag: selectedCountryFlag,
          onSelect: onSelect,
          backgroundColor: backgroundColor,
        ),
      ],
    );
  }
}
