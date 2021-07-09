import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprint/style/theme.dart';
import 'package:provider/provider.dart';

class ChangeThemeSwitch extends StatelessWidget {
  const ChangeThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Transform.scale(
      scale: 1.1,
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) => CupertinoSwitch(
            value: provider.darkTheme,
            activeColor: Theme.of(context).buttonColor,
            onChanged: (value) {
              // final provider = Provider.of<ThemeProvider>(context, listen: false);
              // provider.toggleTheme(value);
              provider.toggleTheme();
            }),
      ),
    );
  }
}
