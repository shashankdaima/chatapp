import 'package:chatapp/resources/colors.dart';
import 'package:chatapp/resources/lengthcontraints.dart';
import 'package:chatapp/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../temporaryValues/chatRoomTemporaryTitles.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstants.secondaryBackground,
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: double.infinity,
              child: CtOutlinedButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 22,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "New Chat",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(left: 6),
                  title: Text(chatRooms[index].title,
                      style: Theme.of(context).textTheme.titleSmall),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                );
              },
              itemCount: chatRooms.length,
            ),
          ),
          const Divider(),
          SizedBox(
              width: double.infinity,
              child:
                  CtTextButton(child: const Text("Logout"), onPressed: () {}))
        ],
      ),
    );
  }
}
