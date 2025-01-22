import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
  });
  final String title;
  final void Function()? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ScaleText(
        title,
        style: theme.textTheme.titleLarge,
      ),
      leading: leading,
      trailing: onTap != null
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              color: theme.colorScheme.primary,
              size: ConstantsManager.iconSize,
            )
          : null,
      onTap: onTap,
    );
  }
}
