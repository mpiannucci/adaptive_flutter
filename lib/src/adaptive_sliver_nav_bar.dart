import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:adaptive_flutter/src/base_nav_bar.dart';

class AdaptiveSliverNavBar extends BaseNavBar {
  final Widget flexibleSpace;
  final bool pinned;

  AdaptiveSliverNavBar(
      {Widget title,
      List<Widget> actions,
      bool useLeadingAction,
      this.flexibleSpace,
      this.pinned = true})
      : super(title, actions, useLeadingAction);

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoSliverNavigationBar(
            leading: buildLeadingAction(),
            trailing: buildTrailingAction(),
            largeTitle: this.flexibleSpace,
            middle: this.title,
            backgroundColor: Theme.of(context).primaryColor,
          )
        : SliverAppBar(
            pinned: this.pinned,
            flexibleSpace: this.flexibleSpace,
            floating: false,
            title: this.title,
            actions: this.actions);
  }
}
