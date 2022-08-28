import 'package:flutter/material.dart';
import 'package:herotest/responsive.dart';

import 'pages.dart';
import 'wide_layout.dart';

void main() {
  runApp(const MyApp());
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final Uri uri = settings.name != null ? Uri.parse(settings.name!) : Uri.parse("/");
  switch(uri.path) {
    case "/":
      return MaterialPageRoute(builder: (context) => OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return const PageOne(title: "Mobile Layout");
          }
          return WideLayoutPage(
            child: const PageOne(title: "Wide Layout"),
            navigatorBuilder: () => const Navigator(
              initialRoute: "/two",
              onGenerateInitialRoutes: defaultGenerateInitialRoutesNested,
              onGenerateRoute: generateRouteNested,
            ),
          );
        },
      ));
    case "/two":
      return MaterialPageRoute(builder: (context) => const PageTwo());
    case "/two/three":
      return MaterialPageRoute(builder: (context) => const PageThree());
    default:
      throw "InvalidPath";
  }
}

List<Route<dynamic>> defaultGenerateInitialRoutesNested(NavigatorState navigatorState, String initialRouteName) {
  return [
    generateRouteNested(RouteSettings(name: initialRouteName))
  ];
}


Route<dynamic> generateRouteNested(RouteSettings settings) {
  final Uri uri = settings.name != null ? Uri.parse(settings.name!) : Uri.parse("/");
  switch(uri.path) {
    case "/":
      return MaterialPageRoute(builder: (context) => const PageTwo());
    case "/two":
      return MaterialPageRoute(builder: (context) => const PageTwo());
    case "/two/three":
      return MaterialPageRoute(builder: (context) => const PageThree());
    default:
      throw "InvalidPath";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hero Rotation Demo',
      onGenerateRoute: generateRoute,
      initialRoute: "/",
    );
    // return MaterialApp.router(
    //   title: 'Hero Rotation Demo',
    //   routeInformationParser: const RoutemasterParser(),
    //   routeInformationProvider: PlatformRouteInformationProvider(initialRouteInformation: const RouteInformation(location: "/layout/two/three")),
    //   routerDelegate: RoutemasterDelegate(
    //     routesBuilder: (context) {
    //       final responsiveView = Responsive.responsiveView(context);
    //       print("Current responsive view is ${responsiveView.toString()}");

    //       return RouteMap(
    //           routes: {
    //             '/layout': (_) {
    //               return responsiveView != ResponsiveViewEnum.mobile
    //               ? StackPage(
    //                 child: WideLayoutPage(
    //                   child: const PageOne(title: "Wide Layout")),
    //                 defaultPath: 'two',
    //               )
    //               : MaterialPageOne(title: "Mobile Layout");
    //             },
    //             '/layout/two': (_) => const MaterialPageTwo(),
    //             '/layout/three': (_) => const MaterialPageThree(),
    //             '/layout/two/three': (_) => const MaterialPageThree(),
    //           },
    //         );
    //     },
    //   ),
    // );
  }
}

