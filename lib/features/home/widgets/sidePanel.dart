import 'package:chatapp/features/home/chatRoomBloc/ChatRoomBloc.dart';
import 'package:chatapp/features/signup/cubit/auth_cubit.dart';
import 'package:chatapp/resources/colors.dart';
import 'package:chatapp/resources/lengthcontraints.dart';
import 'package:chatapp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    ChatRoomBloc chatRoomBloc = BlocProvider.of<ChatRoomBloc>(context);
    TextEditingController inputController = TextEditingController();
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    void _showAddChatRoomDailog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: ColorsConstants.primaryBackground,
            title: const Text(
              'Create new chat room?',
              style: TextStyle(color: Colors.white70),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: inputController,
                  ),
                )),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  chatRoomBloc.add(AddChatRoomEvent(
                      chatRoomId: inputController.text.trim()));
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Stack(
      children: [
        Container(
          color: ColorsConstants.secondaryBackground
              .withOpacity(0.5), // Slightly transparent background color
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                child: CtOutlinedButton(
                  onPressed: () => _showAddChatRoomDailog(context),
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
                ),
              ),
              Expanded(
                child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ListTile(
                            onTap: () {
                              chatRoomBloc.add(SelectChatRoom(
                                  chatRoomId: state.roomIds[index]));
                            },
                            tileColor:
                                (state.currentRoomId == state.roomIds[index])
                                    ? ColorsConstants.secondaryBackgroundLight
                                    : Colors.transparent,
                            contentPadding: const EdgeInsets.only(left: 6),
                            title: Text(
                              state.roomIds[index],
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                      itemCount: state.roomIds.length,
                    );
                  },
                ),
              ),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: CtTextButton(
                  child: const Text("Logout"),
                  onPressed: () {
                    authCubit.signOut();
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
