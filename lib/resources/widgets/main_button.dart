import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.title,
    this.titleWidget,
    required this.onPressed,
    this.backgroundColor,
    this.color,
    this.buttonWidth,
    this.borderSide,
    this.elevation,
    this.borderRadius,
    this.isSecondary = false,
  });

  final String? title;
  final Widget? titleWidget;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? color;
  final double? buttonWidth;
  final BorderSide? borderSide;
  final double? elevation;
  final double? borderRadius;
  final bool isSecondary;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            side: borderSide ?? BorderSide.none,
            // ??
            //     BorderSide(
            //       color: isSecondary
            //           ? theme.colorScheme.primary
            //           : theme.colorScheme.surface,
            //     ),
          ),
          elevation: elevation,
          surfaceTintColor: Colors.transparent,
          backgroundColor: backgroundColor ??
              (isSecondary ? theme.colorScheme.surface : theme.colorScheme.primary),
          minimumSize: Size(width * 0.25, 46.0),
          maximumSize: Size(width, 46.0),
        ),
        onPressed: onPressed,
        child: titleWidget ??
            Text(
              title!,
              style: TextStyle(
                fontSize: 14.0,
                color:
                    color ?? (isSecondary ? theme.colorScheme.primary : theme.colorScheme.surface),
              ),
            ),
      ),
    );
  }
}
