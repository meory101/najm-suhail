import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;

  const AppBarWidget(
      {Key? key, this.leading, this.title, this.actions, this.backgroundColor})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        leading: leading,
        automaticallyImplyLeading: false,
        title: title,
        titleTextStyle: TextStyle(
          color: Colors.green,
          fontSize: 20.0,
        ),
        actions: actions,
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
    );
  }
}
