import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ResponsiveDesign extends StatelessWidget with ResponsiveDesignBreakpoints {
  ResponsiveDesign({
    super.key,
    this.mobile,
    this.tablet,
    this.laptop,
    this.desktop,
    this.tv,
  }) : assert(
          mobile != null || tablet != null || laptop != null || desktop != null || tv != null,
          'At least one of mobile, tablet, laptop, desktop, or tv must be non-null',
        );

  final Widget? mobile;
  final Widget? tablet;
  final Widget? laptop;
  final Widget? desktop;
  final Widget? tv;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (width <= maxMobileWidth) {
      return mobile ?? tablet ?? laptop ?? desktop ?? tv!;
    }
    if (width >= minTabletWidth && width <= maxTabletWidth) {
      return tablet ?? mobile ?? laptop ?? desktop ?? tv!;
    }
    if (width >= minLaptopWidth && width <= maxLaptopWidth) {
      return laptop ?? desktop ?? tablet ?? mobile ?? tv!;
    }
    if (width >= minDesktopWidth && width <= maxDesktopWidth) {
      return desktop ?? laptop ?? tablet ?? mobile ?? tv!;
    }
    if (width <= minTvWidth) {
      return tv ?? desktop ?? laptop ?? tablet ?? mobile!;
    }
    return Container();
  }
}
