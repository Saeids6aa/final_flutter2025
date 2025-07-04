  import 'package:flutter/material.dart';
  import 'registration/SignInScreen.dart';
  import 'registration/SingUpscreen.dart';
  import 'registration/WelcomeScreen.dart';
  import 'Screens/CarListScreen.dart';
  import 'Screens/SplashScreen.dart';
  import 'Screens/ProfileScreen.dart';
  import 'Screens/FilterScreen.dart';
  import 'Screens/SearchCarScreen.dart';
  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => const SignInScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/cars': (context) => const CarListScreen(),
          '/filter': (context) => const FilterScreen(),
          '/search': (context) => const SearchCarScreen(),
          '/profile':(context)=> const  ProfileScreen(),
        },
      );
    }
  }
