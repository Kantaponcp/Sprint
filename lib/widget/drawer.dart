import 'package:flutter/material.dart';
import 'package:sprint/style/text_style.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        SizedBox(
          height: 50,
        ),
        buildMenuItem(
            text: 'History',
            icon: Icons.history_outlined,
            onClicked: () {
              Navigator.of(context).pushNamed('/history');
            }),
        buildMenuItem(
            text: 'Setting',
            icon: Icons.settings_outlined,
            onClicked: () async {
              await Navigator.of(context).pushNamed('/setting');
              setState(() {

              });
            }),
      ],
    )
        // Container(
        //   color: Theme.of(context).backgroundColor,
        //   alignment: Alignment.centerLeft,
        //   padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 50,
        //       ),
        //       buildMenuItem(
        //           text: 'History',
        //           icon: Icons.history_outlined,
        //           onClicked: () {
        //             Navigator.of(context).pushNamed('/history');
        //           }),
        //       buildMenuItem(
        //           text: 'Setting',
        //           icon: Icons.settings_outlined,
        //           onClicked: () {
        //             Navigator.of(context).pushNamed('/setting');
        //           }),
        //     ],
        //   ),
        // ),
        );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    // final hoverColor = Colors.white70;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(text, style: Style.headline2),
        // hoverColor: hoverColor,
        onTap: onClicked,
      ),
    );
  }
}
