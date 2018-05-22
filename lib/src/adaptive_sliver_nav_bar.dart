import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:adaptive_flutter/src/base_nav_bar.dart';

class AdaptiveSliverNavBar extends BaseNavBar {
  final bool largeTitle;
  final bool pinned;

  AdaptiveSliverNavBar(
      {Widget title,
      List<Widget> actions,
      bool useLeadingAction,
      this.largeTitle = true,
      this.pinned = true})
      : super(title, actions, useLeadingAction);

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoSliverNavigationBar(
            leading: buildLeadingAction(),
            trailing: buildTrailingAction(),
            largeTitle: this.largeTitle ? this.title : null,
            middle: this.largeTitle ? null : this.title,
            backgroundColor: Theme.of(context).primaryColor,
          )
        : SliverAppBar(
            pinned: this.pinned,
            floating: false,
            title: this.title,
            actions: this.actions);
  }
}
