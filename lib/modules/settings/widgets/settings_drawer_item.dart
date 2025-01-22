import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class SettingsDrawerItem extends StatelessWidget {
  const SettingsDrawerItem({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.leading,
    this.icon,
    this.svgIcon,
    this.switchValue,
    this.onSwitchValueChanged,
  });

  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final Widget? leading;
  final IconData? icon;
  final String? svgIcon;
  final bool? switchValue;
  final void Function(bool value)? onSwitchValueChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ScaleText(
        title,
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: subtitle != null
          ? ScaleText(
              subtitle!,
              style: theme.textTheme.bodyMedium,
            )
          : null,
      leading: leading ??
          (svgIcon != null
              ? SvgPicture.asset(
                  svgIcon!,
                  width: 24.0,
                  height: 24.0,
                )
              : Icon(
                  icon,
                  size: 24.0,
                  color: theme.colorScheme.primary,
                )),
      trailing: onTap != null
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.0,
              color: theme.colorScheme.primary,
            )
          : switchValue != null
              ? Switch(
                  value: switchValue!,
                  onChanged: (bool value) {
                    if (onSwitchValueChanged != null) {
                      onSwitchValueChanged!(value);
                    }
                  },
                )
              : null,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
