import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  static const String routeName = '/calendar';

  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Calendar')));
  }
}
