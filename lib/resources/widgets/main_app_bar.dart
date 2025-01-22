import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.title,
    this.canBack = false,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.showBottomLine = true,
    this.backgroundColor,
    this.animatedDuration,
    this.animatedHeight,
    this.preferredAdditionalSize = 0,
    this.iconColor,
  });

  final String title;
  final bool canBack;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final bool showBottomLine;
  final Color? backgroundColor;
  final Duration? animatedDuration;
  final double? animatedHeight;
  final int? preferredAdditionalSize;
  final Color? iconColor;

  @override
  Size get preferredSize =>
      Size.fromHeight(ConstantsManager.appbarHeight + preferredAdditionalSize!);

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      systemOverlayStyle: Components().systemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      title: Text(
        title,
        style: theme.textTheme.displaySmall!.copyWith(
          color: customTheme.blackText,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: canBack
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Skeleton.shade(
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: iconColor ?? customTheme.blackText,
                  size: ConstantsManager.iconSize,
                ),
              ),
            )
          : leading,
      bottom: showBottomLine
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: theme.colorScheme.primary,
                height: 0.5,
              ),
            )
          : null,
      actions: actions,
    );
    if (animatedDuration == null || animatedHeight == null) {
      return appBar;
    }
    return AnimatedContainer(
      duration: animatedDuration!,
      height: animatedHeight == 0.0 ? 0.0 : null,
      child: appBar,
    );
  }
}
