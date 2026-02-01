import 'package:evently_app/app_theme.dart';
import 'package:evently_app/onboarding/onboarding.dart';
import 'package:evently_app/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Evently());
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Onboarding.routeName: (_) => Onboarding(),
        WelcomeScreen.routeName: (_) => WelcomeScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
