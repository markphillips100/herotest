import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'wide_layout.dart';

class MaterialPageOne extends MaterialPage<void> {
  MaterialPageOne({required String title})
  : super(child: PageOne(title: title));
}

class PageOne extends StatelessWidget {
  final String title;
  const PageOne({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroKeyPrefix = HeroControllerScopeKey.of(context)?.heroKeyPrefix ?? "";
    final inWideLayoutPage = WideLayoutPageScope.of(context) != null;

    print("Build Page one. heroKeyPrefix: $heroKeyPrefix, inWideLayout: $inWideLayoutPage");

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push('two'),
                child: const Text('Select two'),
              ),
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push('three'),
                child: const Text('Select three'),
              ),
              if (!inWideLayoutPage) Hero(
                tag: "${heroKeyPrefix}hero1",
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 4.0)),
                  child: Image.network('https://picsum.photos/120?image=9')),
              ),
              if (inWideLayoutPage) Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 4.0)),
                child: Image.network('https://picsum.photos/120?image=9')),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialPageTwo extends MaterialPage<void> {
  const MaterialPageTwo() : super(child: const PageTwo());
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroKeyPrefix = HeroControllerScopeKey.of(context)?.heroKeyPrefix ?? "";
    final inWideLayoutPage = WideLayoutPageScope.of(context) != null;

    print("Build Page two. heroKeyPrefix: $heroKeyPrefix, inWideLayout: $inWideLayoutPage");

    return Scaffold(
      appBar: AppBar(title: const Text("Page Two")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Routemaster.of(context).push('three'),
                child: const Text('Select three'),
              ),

              if (!inWideLayoutPage) Hero(
                tag: "${heroKeyPrefix}hero1",
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 4.0)),
                  child: Image.network('https://picsum.photos/120?image=9')),
              ),
              if (inWideLayoutPage) Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 4.0)),
                child: Image.network('https://picsum.photos/120?image=9')),
              Hero(
                tag: "${heroKeyPrefix}hero2",
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 4.0)),
                  child: Image.network('https://picsum.photos/120?image=9')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialPageThree extends MaterialPage<void> {
  const MaterialPageThree() : super(child: const PageThree());
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroKeyPrefix = HeroControllerScopeKey.of(context)?.heroKeyPrefix ?? "";
    final inWideLayoutPage = WideLayoutPageScope.of(context) != null;

    print("Build Page three. heroKeyPrefix: $heroKeyPrefix, inWideLayout: $inWideLayoutPage");

    return Scaffold(
      appBar: AppBar(title: const Text("Page Three")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Routemaster.of(context).pop(),
                child: const Text('Pop'),
              ),
              Hero(
                tag: "${heroKeyPrefix}hero2",
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 4.0)),
                  child: Image.network('https://picsum.photos/120?image=9')),
              ),

              // Responsive(
              //   mobile: Hero(
              //     tag: "mobile-hero1",
              //     child: Container(
              //       decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 4.0)),
              //       child: Image.network('https://picsum.photos/250?image=9'))),
              //   tablet: Hero(
              //     tag: "tablet-hero1",
              //     child: Container(
              //         decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 4.0)),
              //       child: Image.network('https://picsum.photos/250?image=9')),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
