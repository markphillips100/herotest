import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'split_view_container.dart';

class WideLayoutPage extends StatefulWidget {
  final Widget child;

  final HeroController heroController = MaterialApp.createMaterialHeroController();

  WideLayoutPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<WideLayoutPage> createState() => _WideLayoutPageState();
}

class _WideLayoutPageState extends State<WideLayoutPage> {

  @override
  Widget build(BuildContext context) {
    return SplitViewContainer(
      left: HeroMode(enabled: false, child: widget.child),
      right: HeroControllerScope(
        controller: widget.heroController,
        child: PageStackNavigator(
          stack: StackPage.of(context).stack,
        ),
      ),
    );
  }
}
