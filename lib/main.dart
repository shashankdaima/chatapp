import 'package:chatapp/features/home/home.dart';
import 'package:chatapp/features/signup/signup.dart';
import 'package:chatapp/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());

}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return  SignupScreen();
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
    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: false).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorsConstants.secondaryBackground,
            brightness: Brightness.dark,
          ),
          textTheme: const TextTheme(
            titleSmall: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
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
    );
  }
}
