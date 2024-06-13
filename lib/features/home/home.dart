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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UnAuthorized) {
          GoRouter.of(context).replace("/signup");
        }
      },
      builder: (context, authState) {
        if (authState is Authorized) {
          return BlocProvider(
            key: ValueKey(authState.account.email), // Ensure the provider rebuilds
            create: (context) => ChatRoomBloc(authState.account.email),
            child: Scaffold(
              body: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: SizedBox(
                      width: Lengthcontraints.sidePanelWidth,
                      height: size.height,
                      child: const SidePanel(),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width - Lengthcontraints.sidePanelWidth,
                      height: size.height,
                      child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
                        builder: (context, chatRoomState) {
                          return BlocProvider(
                            key: ValueKey(chatRoomState.currentRoomId),
                            create: (context) => ChatBloc(chatRoomState.currentRoomId),
                            child: Stack(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 100.0),
                                  child: Chat(),
                                ),
                                Positioned(
                                  bottom: 24,
                                  child: SizedBox(
                                    width: size.width - Lengthcontraints.sidePanelWidth,
                                    child: const Center(child: Inputbox()),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Return a loading or empty state while unauthorized
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
