import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Inputbox extends StatelessWidget {
  const Inputbox({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 800.0,
        ),
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white, // Change text color here
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter text',
                    ),
                    maxLines: null,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Add your button onPressed functionality here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
