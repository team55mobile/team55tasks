import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  // const BasicPage({Key? key}) : super(key: key);
  const BasicPage({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  final Color background = const Color(0x5F6F7FFF); //todo: theme context
  //children properties, background

  @override
  Widget build(BuildContext context) {
    // return SliverSafeArea(sliver: sliver)

    return SafeArea(
        child: Column(children: [
      Row(children: [Text(title), Text(subtitle)]),
      const Expanded(child: Text('Body'))
    ]));
  }
}
