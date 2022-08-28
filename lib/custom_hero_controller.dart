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

    if (route is PageRoute<dynamic> && route.animation?.status == AnimationStatus.dismissed) {
      print("CustomHeroController [$name].  didPush called. route: ${route.settings.runtimeType}, previousRoute: ${previousRoute?.settings.runtimeType}, toRoute animation status is dismissed so ignore push.");

      return;
    }

    print("CustomHeroController [$name].  didPush called. route: ${route.settings.runtimeType}, previousRoute: ${previousRoute?.settings.runtimeType}");
    super.didPush(route, previousRoute);
  }
}