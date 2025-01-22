// import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

// class MainTextField extends StatelessWidget {
//   const MainTextField({
//     super.key,
//     this.controller,
//     this.hint,
//     this.label,
//     this.secondaryLabel,
//     this.onSecondaryLabelTap,
//     this.readOnly = false,
//     this.keyboardType,
//     this.prefixIcon,
//     this.enabled = true,
//     this.validator,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.obscureText = false,
//     this.textInputAction,
//     this.focusNode,
//     this.autofillHints,
//     this.maxLength,
//     this.padding = const EdgeInsets.symmetric(vertical: 8.0),
//     this.minLines,
//     this.maxLines = 1,
//     this.suffixIcon,
//     this.inputFormatters,
//     this.upperCaseText,
//   });

//   final TextEditingController? controller;
//   final String? hint;
//   final String? label;
//   final String? secondaryLabel;
//   final void Function()? onSecondaryLabelTap;
//   final bool readOnly;
//   final TextInputType? keyboardType;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final bool enabled;
//   final FocusNode? focusNode;
//   final String? Function(String?)? validator;
//   final void Function(String?)? onChanged;
//   final void Function(String?)? onFieldSubmitted;
//   final bool obscureText;
//   final TextInputAction? textInputAction;
//   final List<String>? autofillHints;
//   final int? maxLength;
//   final EdgeInsetsGeometry padding;
//   final int? minLines;
//   final int? maxLines;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool? upperCaseText;
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (label != null) ...[
//               SizedBox(
//                 width:
//                     constraints.maxWidth == 0.0 ? null : constraints.maxWidth,
//                 child: SizedBox(
//                   width:
//                       constraints.maxWidth == 0.0 ? null : constraints.maxWidth,
//                   child: Row(
//                     mainAxisAlignment: secondaryLabel != null
//                         ? MainAxisAlignment.spaceBetween
//                         : MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: secondaryLabel != null
//                             ? constraints.maxWidth * 0.65
//                             : constraints.maxWidth,
//                         child: ScaleText(
//                           label!,
//                           textAlign: TextAlign.start,
//                           maxLines: 1,
//                           style: theme.textTheme.titleLarge!.copyWith(
//                             color: customTheme.blueGreyText,
//                           ),
//                         ),
//                       ),
//                       if (secondaryLabel != null)
//                         GestureDetector(
//                           onTap: onSecondaryLabelTap,
//                           child: SizedBox(
//                             width: constraints.maxWidth * 0.35,
//                             child: ScaleText(
//                               secondaryLabel!,
//                               isFromDialog: true,
//                               textAlign: TextAlign.end,
//                               style: theme.textTheme.titleSmall!.copyWith(
//                                 color: customTheme.lightGreyText,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 4.0),
//             ],
//             TextFormField(
//               controller: controller,
//               autofillHints: autofillHints,
//               obscureText: obscureText,
//               readOnly: readOnly,
//               enabled: enabled,
//               keyboardType: keyboardType,
//               focusNode: focusNode,
//               textInputAction: textInputAction,
//               maxLength: maxLength,
//               minLines: minLines,
//               maxLines: maxLines,
//               style: TextStyle(
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.w400,
//                 color: customTheme.blueGreyText,
//               ),
//               decoration: InputDecoration(
//                 fillColor: customTheme.secondaryBackground,
//                 filled: true,
//                 floatingLabelStyle: TextStyle(
//                   fontSize: 12.0,
//                   color: customTheme.blueGreyText,
//                 ),
//                 hintText: hint,
//                 hintStyle: TextStyle(
//                   fontSize: 12.0,
//                   color: customTheme.lightGreyText,
//                 ),
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   child: prefixIcon,
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 7.0),
//                 prefixIconColor: theme.colorScheme.primary,
//                 prefixIconConstraints: const BoxConstraints(
//                   maxHeight: 28.0,
//                   maxWidth: 32.0,
//                 ),
//                 suffixIcon: Padding(
//                   padding: EdgeInsets.only(
//                     right: Components().isRTL() ? 0.0 : 8.0,
//                     left: Components().isRTL() ? 8.0 : 0.0,
//                   ),
//                   child: suffixIcon,
//                 ),
//                 suffixIconConstraints: const BoxConstraints(
//                   maxHeight: 24.0,
//                   maxWidth: 32.0,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide(
//                     color: customTheme.lightGrey,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide(
//                     color: customTheme.lightGrey,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide(
//                     color: !readOnly
//                         ? theme.colorScheme.primary
//                         : customTheme.lightGrey,
//                   ),
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide(
//                     color: customTheme.lightGrey,
//                   ),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide(
//                     color: theme.colorScheme.error,
//                   ),
//                 ),
//               ),
//               inputFormatters: [
//                 if (upperCaseText == true) UpperCaseTextFormatter(),
//                 if (inputFormatters != null) ...inputFormatters!,
//               ],
//               validator: validator,
//               onChanged: onChanged,
//               onFieldSubmitted: onFieldSubmitted,
//               onTapOutside: (_) {
//                 FocusManager.instance.primaryFocus?.unfocus();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     return TextEditingValue(
//       text: newValue.text.toUpperCase(),
//       selection: newValue.selection,
//     );
//   }
// }
