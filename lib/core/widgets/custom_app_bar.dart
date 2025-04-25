import 'package:flutter/material.dart';
import 'package:tour_guide/core/utils/color_manager.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key, this.title, this.actions, this.leading, this.centerTitle});
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      centerTitle: centerTitle ?? true,
      actions: actions,
      backgroundColor: ColorManager.lightBeigeColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
