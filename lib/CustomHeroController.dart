import 'package:flutter/material.dart';

class CustomHeroController extends HeroController {
  final String name;

  CustomHeroController(this.name, { createRectTween })
  : super(createRectTween: createRectTween);

  static HeroController createMaterialHeroController(String name) {
    return CustomHeroController(name,
      createRectTween: (Rect? begin, Rect? end) {
        return MaterialRectArcTween(begin: begin, end: end);
      },
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("CustomHeroController [$name].  didPush called.");

    super.didPush(route, previousRoute);
  }
}