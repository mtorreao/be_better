import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final Stream<int> stream;
  final List<BottomNavigationBarItem> items;
  final Function(int) onTap;

  const CustomNavigationBar({
    @required this.stream,
    @required this.items,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: stream,
        initialData: 0,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            currentIndex: snapshot.data,
            items: items,
            onTap: onTap,
          );
        });
  }
}
