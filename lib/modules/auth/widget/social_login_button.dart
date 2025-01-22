import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.svgIcon = '',
  });

  final String text;
  final IconData? icon;
  final String? svgIcon;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Ink(
        decoration: BoxDecoration(
          color: customTheme.filled,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: theme.dividerColor),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (svgIcon != '')
              SvgPicture.asset(
                svgIcon!,
                width: ConstantsManager.iconSize,
                height: ConstantsManager.iconSize,
              ),
            if (svgIcon == '' && icon != null)
              Icon(
                icon,
                color: Components().isDark()
                    ? customTheme.white.withValues(alpha: 0.9)
                    : customTheme.black.withValues(alpha: 0.9),
                size: ConstantsManager.iconSize,
              ),
            const SizedBox(width: 8.0),
            ScaleText(
              text,
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
