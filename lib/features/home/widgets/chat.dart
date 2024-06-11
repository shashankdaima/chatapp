import 'package:chatapp/features/home/chatBloc/ChatBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../temporaryValues/chatRoomTemporaryChat.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatBloc chatBloc = BlocProvider.of<ChatBloc>(context);
    chatBloc.add(OpenWs());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    ChatBloc chatBloc = BlocProvider.of<ChatBloc>(context);
    chatBloc.add(CloseWs());
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ChatBloc bloc = BlocProvider.of<ChatBloc>(context);
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
        return ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            final item = state.chats[index];
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
                            (item.role == ChatRole.user)
                                ? "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                                : "https://images.pexels.com/photos/2085831/pexels-photo-2085831.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Text(
                        "${state.chatRoomId}  ${item.title}",
                        style: const TextStyle(color: Colors.white70),
                      )),
                    ],
                  ),
                ),
              )),
            );
          },
          itemCount: state.chats.length,
        );
      },
    );
  }
}
