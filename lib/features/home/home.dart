import 'package:chatapp/features/home/chatBloc/ChatBloc.dart';
import 'package:chatapp/features/home/chatRoomBloc/ChatRoomBloc.dart';
import 'package:chatapp/features/home/widgets/chat.dart';
import 'package:chatapp/features/home/widgets/inputBox.dart';
import 'package:chatapp/features/home/widgets/sidePanel.dart';
import 'package:chatapp/features/signup/cubit/auth_cubit.dart';
import 'package:chatapp/resources/lengthcontraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// import '../../services/wsService.dart';

List<ChatMessage> hardcodedChats = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    if (authCubit.state is UnAuthorized) {
      GoRouter.of(context).replace("/signup");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UnAuthorized) {
          GoRouter.of(context).replace("/signup");
        }
      },
      child: BlocProvider(
        create: (context) => ChatRoomBloc(),
        child: Scaffold(
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
                    height: size.height,
                    child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
                      builder: (context, state) {
                        //need to ix this, this bloc building is rerendering twice...
                        // print(state.currentRoomId);
                        return BlocProvider(
                          key: ValueKey(state.currentRoomId),
                          create: (context) => ChatBloc(state.currentRoomId),
                          child: Stack(children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 100.0),
                              child: Chat(),
                            ),
                            Positioned(
                                bottom: 24,
                                child: SizedBox(
                                    width: size.width -
                                        Lengthcontraints.sidePanelWidth,
                                    child: const Center(child: Inputbox()))),
                          ]),
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
