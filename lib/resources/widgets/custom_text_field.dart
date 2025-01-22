import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.label,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofillHints,
    this.textInputType,
    this.textInputAction,
    this.focusNode,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.enabled,
    this.initialValue,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.helperText,
    this.helperTextDirection,
  });

  final TextEditingController? controller;
  final bool obscureText;
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final List<String>? autofillHints;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? initialValue;
  final TextAlign textAlign;
  final bool readOnly;
  final String? helperText;
  final TextDirection? helperTextDirection;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      textAlign: textAlign,
      focusNode: focusNode,
      obscureText: obscureText,
      autofillHints: autofillHints,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      enabled: enabled,
      style: theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.normal,
      ),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLines: maxLines,
      readOnly: readOnly,
      decoration: InputDecoration(
        filled: true,
        fillColor: customTheme.filled,
        focusColor: customTheme.filled,
        hoverColor: customTheme.filled,
        labelText: label,
        labelStyle: theme.textTheme.titleLarge!.copyWith(
          fontSize: 12.0,
        ),
        errorStyle: theme.textTheme.titleMedium!.copyWith(
          color: customTheme.error,
        ),
        helper: helperText != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ScaleText(
                      helperText!,
                      textDirection: helperTextDirection,
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: customTheme.grey,
                      ),
                    ),
                  ),
                ],
              )
            : null,
        errorMaxLines: 2,
        hintText: hint,
        hintTextDirection: TextDirection.ltr,
        hintStyle: theme.textTheme.titleMedium!.copyWith(
          color: customTheme.grey,
        ),
        counterStyle: theme.textTheme.titleMedium!.copyWith(
          color: customTheme.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: customTheme.grey,
            width: 0.1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: customTheme.grey,
            width: 0.1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: customTheme.grey,
            width: 0.1,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      onTap: onTap,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      inputFormatters: inputFormatters,
    );
  }
}
