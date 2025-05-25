import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/pages/calendar.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/widgets/svg_assets.dart';
import 'package:todo_app/widgets/svg_icon.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;

  const BaseScaffold({super.key, required this.body});

  static final List<Map<String, dynamic>> tabs = [
    {
      'route': Home.routeName,
      'icon': SvgIconName.home,
      'activeIcon': SvgIconName.homeSolid,
    },
    {
      'route': Calendar.routeName,
      'icon': SvgIconName.calendar,
      'activeIcon': SvgIconName.calendarSolid,
    },
  ];

  int _locationToTabIndex(String location) {
    return tabs.indexWhere((tab) => location == tab['route']);
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = _locationToTabIndex(location);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 20),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          final tab = tabs[index];
          if (tab != null) {
            context.go(tab['route']!);
          }
        },
        items:
            tabs
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: SvgIcon(
                      name: tab['icon']!,
                      size: 24,
                      color: Color(0xFF9CA4AB),
                    ),
                    activeIcon: SvgIcon(
                      name: tab['activeIcon']!,
                      size: 24,
                      color: Color(0xFF3DCAB1),
                    ),
                    label: '',
                  ),
                )
                .toList(),
      ),
      body: body,
    );
  }
}
