import 'package:flutter/material.dart';

import 'CustomHeroController.dart';
import 'hero_controller_scope_key.dart';
import 'split_view_container.dart';

class WideLayoutPage extends StatefulWidget {
  final Widget child;
  final Navigator Function() navigatorBuilder;

//  final HeroController heroController = MaterialApp.createMaterialHeroController();
  final HeroController heroController = CustomHeroController.createMaterialHeroController("wide");

  WideLayoutPage({
    Key? key,
    required this.child,
    required this.navigatorBuilder,
  }) : super(key: key);

  @override
  State<WideLayoutPage> createState() => _WideLayoutPageState();
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
          child: widget.navigatorBuilder(),
        ),
      ),
    );
  }

}
