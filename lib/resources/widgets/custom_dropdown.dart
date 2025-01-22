import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.value,
    this.hint,
    this.label,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.suffixIcon,
    this.items,
  });

  final T? value;
  final String? hint;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      focusNode: focusNode,
      style: theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      ),
      hint: hint != null
          ? Align(
              alignment: Alignment.centerLeft,
              child: Text(
                hint!,
                style: theme.textTheme.titleMedium,
              ),
            )
          : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: customTheme.filled,
        focusColor: customTheme.filled,
        hoverColor: customTheme.filled,
        labelText: label,
        labelStyle: theme.textTheme.titleLarge,
        errorStyle: theme.textTheme.titleMedium!.copyWith(
          color: customTheme.error,
        ),
        alignLabelWithHint: true,
        errorMaxLines: 2,
        // hintText: hint,
        counterStyle: theme.textTheme.titleMedium!.copyWith(
          color: customTheme.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: customTheme.grey,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
    );
  }
}
