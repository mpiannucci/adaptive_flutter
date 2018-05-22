import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AdaptiveBottomNavBar extends StatelessWidget {
  
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;

  AdaptiveBottomNavBar({@required this.items, @required this.currentIndex, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return theme.platform == TargetPlatform.iOS ?
    CupertinoTabBar(
      items: this.items,
      backgroundColor: theme.bottomAppBarColor,
      activeColor: theme.iconTheme.color,
      inactiveColor: theme.disabledColor,
      currentIndex: this.currentIndex,
      onTap: this.onTap,
    ) : BottomNavigationBar(
      items: this.items,
      currentIndex: this.currentIndex,
      onTap: this.onTap,
    );
  }
}