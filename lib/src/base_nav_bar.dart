import 'package:flutter/material.dart';

abstract class BaseNavBar extends StatelessWidget {
  final Widget title;
  final List<Widget> actions;
  final bool useLeadingAction;

  BaseNavBar(this.title, this.actions, this.useLeadingAction);

  Widget buildLeadingAction() {
    if (this.actions == null || !this.useLeadingAction) {
      return null;
    } else if (this.actions.length < 1) {
      return null;
    }
    return this.actions[0];
  }

  Widget buildTrailingAction() {
    if (this.actions == null) {
      return null;
    } if (this.actions.length < 2 && this.useLeadingAction) {
      return null;
    }
    return this.useLeadingAction ? this.actions[1] : this.actions[0];
  }
}