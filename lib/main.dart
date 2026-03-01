import 'package:evently_app/app_theme.dart';
import 'package:evently_app/auth/register_screen.dart';
import 'package:evently_app/home.dart';
import 'package:evently_app/onboarding/onboarding.dart';
import 'package:evently_app/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('onboarding_completed') ?? false;

  runApp(Evently(seenOnboarding: seenOnboarding));
}

class Evently extends StatelessWidget {
  final bool seenOnboarding;
  const Evently({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: seenOnboarding
          ? RegisterScreen.routeName
          : WelcomeScreen.routeName,
      routes: {
        Home.routeName: (_) => Home(),
        Onboarding.routeName: (_) => Onboarding(),
        WelcomeScreen.routeName: (_) => WelcomeScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
      },
    );
  }
}
