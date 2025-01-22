import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class CustomBottomSheetButton extends StatelessWidget {
  const CustomBottomSheetButton({
    super.key,
    required this.title,
    this.titleColor,
    this.onTap,
  });
  final String title;
  final Color? titleColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Ink(
          height: 60.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: customTheme.filled,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: ScaleText(
              title,
              style: theme.textTheme.titleMedium!.copyWith(
                color: titleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
