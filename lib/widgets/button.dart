import 'package:flutter/material.dart';

class CtOutlinedButton extends StatelessWidget {
  CtOutlinedButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 10)});

  final Widget child;
  final VoidCallback onPressed;
  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
      ),
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class CtElevatedButton extends StatelessWidget {
  CtElevatedButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 10)});

  final Widget child;
  final VoidCallback onPressed;
  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
      ),
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class CtTextButton extends StatelessWidget {
  CtTextButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 10)});

  final Widget child;
  final VoidCallback onPressed;
  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
      ),
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
