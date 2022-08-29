import 'package:flutter/material.dart';
import 'package:herotest/responsive.dart';
import 'package:routemaster/routemaster.dart';

import 'custom_hero_controller.dart';
import 'pages.dart';
import 'wide_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Use this controller to support bypass possible hero animation if the toRoute animation is already dismissed.
  // final mainHeroController = CustomHeroController.createMaterialHeroController();
  // Use this controller to show assertion.
  final mainHeroController = MaterialApp.createMaterialHeroController();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hero Rotation Demo',
      routeInformationParser: const RoutemasterParser(),
//      routeInformationProvider: PlatformRouteInformationProvider(initialRouteInformation: const RouteInformation(location: "/layout")),
      routerDelegate: RoutemasterDelegate.builder(
        navigatorBuilder: (context, stack) {
          return HeroControllerScope(
            controller: mainHeroController,
            child: PageStackNavigator(
              stack: stack,
            ),
          );
        },
        routesBuilder: (context) {
          final responsiveView = Responsive.responsiveView(context);
          print("Current responsive view is ${responsiveView.toString()}");

          return RouteMap(
              routes: {
                '/':(route) => const Redirect("/layout"),
                '/layout': (_) {
                  return responsiveView != ResponsiveViewEnum.mobile
                  ? StackPage(
                    child: WillPopScope(
                      onWillPop: () async => false,
                      child: WideLayoutPage(
                        child: const PageOne(title: "Wide Layout")),
                    ),
                    defaultPath: 'two',
                  )
                  : MaterialPageOne(title: "Mobile Layout");
                },
                '/layout/two': (_) => const MaterialPageTwo(),
                '/layout/three': (_) => const MaterialPageThree(),
                '/layout/two/three': (_) => const MaterialPageThree(),
              },
            );
        },
      ),
    );
  }
}

