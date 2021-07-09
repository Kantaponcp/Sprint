import 'package:flutter/material.dart';
import 'package:sprint/style/text_style.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({
    Key? key,
  })  : preferredSize = Size.fromHeight(80),
        super(key: key);

  final Size preferredSize;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
      child: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'SPRINT',
          style: Style.HomeHeaderStyle,
        ),
        flexibleSpace: Container(
          color: Theme.of(context).primaryColor,
          width: 200,
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.menu_outlined,
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
