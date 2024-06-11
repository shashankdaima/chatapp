import 'package:chatapp/features/home/home.dart';
import 'package:chatapp/features/signup/cubit/auth_cubit.dart';
import 'package:chatapp/features/signup/signup.dart';
import 'package:chatapp/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/signup",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: "SignupScreen",
          path: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignupScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp.router(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(useMaterial3: false).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: ColorsConstants.secondaryBackground,
              brightness: Brightness.dark,
            ),
            textTheme: const TextTheme(
              titleSmall: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            scaffoldBackgroundColor: ColorsConstants
                .primaryBackground, // Set your background color here
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white, // Text color
                  textStyle: const TextStyle(fontWeight: FontWeight.w300)),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Text color for text buttons
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(),
            ),
            cardTheme: const CardTheme(
                color: ColorsConstants.primaryBackgroundLight, elevation: 4),
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
            )),
        routerConfig: _router,
      ),
    );
  }
}
