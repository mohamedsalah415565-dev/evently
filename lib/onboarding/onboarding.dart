import 'package:evently_app/app_theme.dart';
import 'package:evently_app/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_screen/home.dart'; // Make sure this import matches your project structure

class Onboarding extends StatefulWidget {
  static const String routeName = '/onboarding';

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// ---------------- HEADER ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex != 0
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppTheme.primary,
                          ),
                          onPressed: () {
                            if (currentIndex > 0) {
                              _controller.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        )
                      : const SizedBox(width: 48),
                  Image.asset('assets/images/headerlight.png', height: 40),
                  currentIndex != onboardingContents.length - 1
                      ? TextButton(
                          onPressed: () {
                            completeOnboarding();
                            if (!mounted) return;
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(Home.routeName);
                          },
                          child: Text(
                            'Skip',
                            style: textTheme.titleMedium!.copyWith(
                              color: AppTheme.primary,
                            ),
                          ),
                        )
                      : const SizedBox(width: 48),
                ],
              ),
            ),

            /// ---------------- PAGEVIEW ----------------
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingContents.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onboardingContents[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// IMAGE
                        Center(
                          child: Image.asset(
                            item.imageIntro,
                            height: 343,
                            width: 343,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// DOTS (BETWEEN IMAGE & TEXT)
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              onboardingContents.length,
                              (dotIndex) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: currentIndex == dotIndex ? 22 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: currentIndex == dotIndex
                                      ? AppTheme.primary
                                      : AppTheme.gray,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// TITLE
                        Text(
                          item.title,
                          style: textTheme.titleLarge!.copyWith(
                            color: AppTheme.black,
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// DESCRIPTION
                        Text(
                          item.details,
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.gray,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// ---------------- BUTTON ----------------
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 130,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: AppTheme.primary,
                ),
                onPressed: () {
                  if (currentIndex == onboardingContents.length - 1) {
                    completeOnboarding();
                    if (!mounted) return;
                    Navigator.pushReplacementNamed(context, Home.routeName);
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  currentIndex == onboardingContents.length - 1
                      ? "Let's Start"
                      : "Next",
                  style: textTheme.titleLarge!.copyWith(color: AppTheme.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Save onboarding completion
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
  }
}
