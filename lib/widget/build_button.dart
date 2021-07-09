import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key,
    required this.child,
    required this.onClicked,
    required this.shape,
    required this.padding,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onClicked;
  final ShapeBorder shape;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      onPressed: onClicked,
      padding: padding,
      shape: shape,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
    );
  }
}
