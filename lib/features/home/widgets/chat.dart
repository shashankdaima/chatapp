import 'package:flutter/material.dart';

import '../../../temporaryValues/chatRoomTemporaryChat.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = hardcodedChats[index];
        return Container(
          color: (item.role == ChatRole.socket)
              ? const Color(0xff444654)
              : Colors.transparent,
          child: Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 800.0,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(
                        fit: BoxFit.cover,
                        height: 32,
                        width: 32,
                        "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  ),
                  SizedBox(width: 12,),
                  Text(item.title, style: TextStyle(color: Colors.white70),),
                ],
              ),
            ),
          )),
        );
        // return Text(.title);
      },
      itemCount: hardcodedChats.length,
    );
  }
}
