import 'package:atelier02_ui/shared/MenuBottom.dart';
import 'package:atelier02_ui/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Globo Fitness')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: MenuBottom(),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fitness.jpeg'), fit: BoxFit.cover)),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Text(
                'Commit to be fit, dare to be great with Globo Fitness',
                style: TextStyle(fontSize: 20, shadows: [
                  Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.grey)
                ]),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
