import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.url,
  });

  final IconData? icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        try {
          await launchUrl(
            Uri.parse(ConstantsManager.termsAndConditionsUrl),
            mode: LaunchMode.externalApplication,
          );
        } catch (_) {
          ExceptionManager().showException();
        }
      },
      icon: CircleAvatar(
        radius: 20.0,
        backgroundColor: customTheme.blackText,
        child: Icon(
          icon,
          color: Components().isDark()
              ? customTheme.black.withValues(alpha: 0.9)
              : customTheme.white.withValues(alpha: 0.9),
          size: ConstantsManager.iconSize,
        ),
        // child: SvgPicture.asset(
        //   svgIcon,
        //   width: 24.0,
        //   height: 24.0,
        //   colorFilter: ColorFilter.mode(
        //     Components().isDark()
        //         ? customTheme.black.withOpacity(0.9)
        //         : customTheme.white.withOpacity(0.9),
        //     BlendMode.srcIn,
        //   ),
        // ),
      ),
    );
  }
}
