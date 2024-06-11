import 'package:chatapp/features/signup/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart' as web;

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is Authorized) {
        GoRouter.of(context).go('/');
      }
    }, builder: (context, state) {
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Sign and get access to chat screen "),
            const SizedBox(
              height: 12,
            ),
            (GoogleSignInPlatform.instance as web.GoogleSignInPlugin)
                .renderButton(),
          ],
        ),
      ));
    });
  }
}
