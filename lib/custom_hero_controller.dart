import 'package:flutter/material.dart';

class CustomHeroController extends HeroController {
  CustomHeroController({ createRectTween })
  : super(createRectTween: createRectTween);

  static HeroController createMaterialHeroController() {
    return CustomHeroController(createRectTween: (Rect? begin, Rect? end) {
        return MaterialRectArcTween(begin: begin, end: end);
      },
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute<dynamic> && route.animation?.status == AnimationStatus.dismissed) {
      return;
    }
    super.didPush(route, previousRoute);
  }
}