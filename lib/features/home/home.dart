import 'package:chatapp/features/home/widgets/chat.dart';
import 'package:chatapp/features/home/widgets/inputBox.dart';
import 'package:chatapp/features/home/widgets/sidePanel.dart';
import 'package:chatapp/resources/lengthcontraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: 0,
          child: SizedBox(
              width: Lengthcontraints.sidePanelWidth,
              height: size.height,
              child: const SidePanel()),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox(
              width: size.width - Lengthcontraints.sidePanelWidth,
              height: size.height - Lengthcontraints.bottomInputHeight,
              child: const Chat()),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
              width: size.width - Lengthcontraints.sidePanelWidth,
              height: Lengthcontraints.bottomInputHeight,
              child: const Inputbox()),
        ),
      ],
    ));
  }
}
