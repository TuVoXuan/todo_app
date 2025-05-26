import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/pages/calendar.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/todo_item_form.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3DCAB1),
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 20, color: Colors.white),
        onPressed: () => context.goNamed(TodoItemForm.routeName),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        height: 60,
        notchMargin: 10,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(tabs.length, (index) {
            final tab = tabs[index];
            final isSelected = index == selectedIndex;

            return IconButton(
              icon: SvgIcon(
                name: isSelected ? tab['activeIcon'] : tab['icon'],
                size: 24,
                color: isSelected ? Color(0xFF3DCAB1) : Color(0xFF9CA4AB),
              ),
              onPressed: () {
                if (!isSelected) {
                  context.go(tab['route']);
                }
              },
            );
          }),
        ),
      ),
      body: body,
    );
  }
}
