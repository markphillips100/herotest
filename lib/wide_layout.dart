import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'CustomHeroController.dart';
import 'split_view_container.dart';

class WideLayoutPage extends StatefulWidget {
  final Widget child;

//  final HeroController heroController = MaterialApp.createMaterialHeroController();
  final HeroController heroController = CustomHeroController.createMaterialHeroController("wide");

  WideLayoutPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<WideLayoutPage> createState() => _WideLayoutPageState();
}

class HeroControllerScopeKey extends InheritedWidget {
  final String heroKeyPrefix;

  const HeroControllerScopeKey({Key? key, required this.heroKeyPrefix, required Widget child})
  : super(child: child);

  bool updateShouldNotify(HeroControllerScopeKey oldWidget) =>
    oldWidget.heroKeyPrefix != heroKeyPrefix;

  static HeroControllerScopeKey? of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<HeroControllerScopeKey>();
}

class _WideLayoutPageState extends State<WideLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return SplitViewContainer(
      left: HeroMode(enabled: false, child: widget.child),
      right: HeroControllerScopeKey(
        heroKeyPrefix: "wide-",
        child: HeroControllerScope(
          controller: widget.heroController,
          child: PageStackNavigator(
            stack: StackPage.of(context).stack,
          ),
        ),
      ),
    );
  }

}
