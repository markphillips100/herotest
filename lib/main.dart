import 'package:flutter/material.dart';
import 'package:herotest/responsive.dart';
import 'package:routemaster/routemaster.dart';

import 'pages.dart';
import 'wide_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hero Rotation Demo',
      routeInformationParser: const RoutemasterParser(),
      routeInformationProvider: PlatformRouteInformationProvider(initialRouteInformation: const RouteInformation(location: "/wide-layout")),
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) {
          final responsiveView = Responsive.responsiveView(context);
          print("Current responsive view is ${responsiveView.toString()}");

          return RouteMap(
              routes: {
                '/wide-layout': (_) {
                  return responsiveView != ResponsiveViewEnum.mobile
                  ? StackPage(
                    child: WideLayoutPage(
                      child: const PageOne(title: "Wide Layout")),
                    defaultPath: 'two',
                  )
                  : MaterialPageOne(title: "Mobile Layout");
                },
                '/wide-layout/two': (_) => const MaterialPageTwo(),
                '/wide-layout/three': (_) => const MaterialPageThree(),
                '/wide-layout/two/three': (_) => const MaterialPageThree(),
              },
            );
        },
      ),
    );
  }
}

