import 'package:flutter/material.dart';

class HeroControllerScopeKey extends InheritedWidget {
  final String heroKeyPrefix;

  const HeroControllerScopeKey({Key? key, required this.heroKeyPrefix, required Widget child})
  : super(child: child);

  bool updateShouldNotify(HeroControllerScopeKey oldWidget) =>
    oldWidget.heroKeyPrefix != heroKeyPrefix;

  static HeroControllerScopeKey? of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<HeroControllerScopeKey>();
}
