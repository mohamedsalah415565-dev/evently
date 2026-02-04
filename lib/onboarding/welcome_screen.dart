import 'package:evently_app/app_theme.dart';
import 'package:evently_app/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/WelcomeScreen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Language: English / Arabic
  final List<bool> languageSelected = [true, false];

  // Theme: Light / Dark
  final List<bool> themeSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header Image
              Center(child: Image.asset('assets/images/headerlight.png')),

              /// Welcome Image
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Image.asset(
                  'assets/images/welocome.png',
                  height: 343,
                  width: 343,
                ),
              ),

              /// Title
              Text(
                'Personalize Your Experience',
                style: textTheme.titleLarge!.copyWith(color: AppTheme.black),
              ),

              SizedBox(height: 8),

              /// Description
              Text(
                'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                style: textTheme.titleMedium!.copyWith(color: AppTheme.gray),
              ),

              SizedBox(height: 16),

              /// Language Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language',
                    style: textTheme.headlineSmall!.copyWith(
                      color: AppTheme.primary,
                    ),
                  ),
                  ToggleButtons(
                    isSelected: languageSelected,
                    onPressed: (index) {
                      setState(() {
                        for (int i = 0; i < languageSelected.length; i++) {
                          languageSelected[i] = i == index;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: AppTheme.white,
                    fillColor: AppTheme.primary,
                    color: AppTheme.primary,
                    constraints: const BoxConstraints(minHeight: 32),
                    borderColor: Colors.transparent,

                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        child: Text('English'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        child: Text('Aarbic'),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),

              /// Theme Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Theme',
                    style: textTheme.headlineSmall!.copyWith(
                      color: AppTheme.primary,
                    ),
                  ),
                  ToggleButtons(
                    isSelected: themeSelected,
                    onPressed: (index) {
                      setState(() {
                        for (int i = 0; i < themeSelected.length; i++) {
                          themeSelected[i] = i == index;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: AppTheme.white,
                    fillColor: AppTheme.primary,
                    color: AppTheme.primary,
                    constraints: BoxConstraints(minHeight: 32),
                    borderColor: Colors.transparent,

                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        child: Icon(Icons.light_mode),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        child: Icon(Icons.dark_mode),
                      ),
                    ],
                  ),
                ],
              ),

              /// Let's Started Button
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: 110,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      foregroundColor: AppTheme.white,
                      backgroundColor: AppTheme.primary,
                    ),
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Onboarding.routeName);
                    },
                    child: Text(
                      "Let's Started",
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
