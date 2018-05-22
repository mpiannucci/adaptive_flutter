import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:adaptive_flutter/src/base_nav_bar.dart';

class AdaptiveNavBar extends BaseNavBar implements PreferredSizeWidget {
  
  @override
  final Size preferredSize;

  AdaptiveNavBar({Widget title, List<Widget> actions, bool useLeadingAction, double height=kToolbarHeight}) :
      preferredSize = Size.fromHeight(height),
      super(title, actions, useLeadingAction);

  @override
    Widget build(BuildContext context) {
      return Theme.of(context).platform == TargetPlatform.iOS ?
      CupertinoNavigationBar(
        actionsForegroundColor: Colors.white,
        middle: this.title,
        leading: buildLeadingAction(),
        trailing: buildTrailingAction(),
        backgroundColor: Theme.of(context).primaryColor,
      )
      : AppBar(
        title: this.title,
        actions: this.actions
      );
    }


}