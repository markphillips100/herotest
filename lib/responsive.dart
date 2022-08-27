import 'package:flutter/material.dart';

enum ResponsiveViewEnum {mobile, tablet, desktop}

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  static double kTabletBreakpoint = 650.0;
  static double kDesktopBreakpoint = 1100.0;

  static ResponsiveViewEnum responsiveView(BuildContext context) {
    if (isMobile(context)) return ResponsiveViewEnum.mobile;
    if (isTablet(context)) return ResponsiveViewEnum.tablet;
    if (isDesktop(context)) return ResponsiveViewEnum.desktop;

    throw "Unable to determine responsive view";
  }

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < kTabletBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < kDesktopBreakpoint &&
      MediaQuery.of(context).size.width >= kTabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= kDesktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    switch (responsiveView(context)) {
      case ResponsiveViewEnum.mobile: return mobile;
      case ResponsiveViewEnum.tablet: return tablet ?? mobile;
      case ResponsiveViewEnum.desktop: return desktop ?? tablet ?? mobile;
    }
  }

}