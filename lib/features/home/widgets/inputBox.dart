import 'package:chatapp/features/home/chatBloc/ChatBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Inputbox extends StatefulWidget {
  const Inputbox({Key? key});

  @override
  State<Inputbox> createState() => _InputboxState();
}

class _InputboxState extends State<Inputbox> {
  final inputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChatBloc chatBloc = BlocProvider.of<ChatBloc>(context);
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
                    controller: inputTextController,
                    style: const TextStyle(
                      color: Colors.white, // Change text color here
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter text',
                    ),
                    maxLines: null,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    chatBloc.add(ChatMessageAddedBySystem(
                        message: inputTextController.text.trim()));
                    inputTextController.clear();
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
