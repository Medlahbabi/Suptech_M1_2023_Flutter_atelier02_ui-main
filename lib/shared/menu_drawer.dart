import 'package:atelier02_ui/screens/bmi_screen.dart';
import 'package:atelier02_ui/screens/intro_screen.dart';
import 'package:atelier02_ui/screens/sessions_screen.dart';
import 'package:atelier02_ui/screens/weather_screen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training'
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Center(
          child: Text(
            'Globo Fitness',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        )));
    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(
          element,
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = IntroScreen();
              break;
            case 'BMI Calculator':
              screen = BmiScreen();
              break;
            case 'Weather':
              screen = WeatherScreen();
              break;
            case 'Training':
              screen = SessionScreen();
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
