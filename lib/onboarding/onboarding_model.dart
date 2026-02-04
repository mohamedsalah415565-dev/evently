class OnboardingModel {
  final String imageIntro;
  final String title;
  final String details;

  OnboardingModel({
    required this.imageIntro,
    required this.title,
    required this.details,
  });
}

final List<OnboardingModel> onboardingContents = [
  OnboardingModel(
    imageIntro: 'assets/images/intro_1.png',
    title: 'Find Events That Inspire You',
    details:
        "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
  ),
  OnboardingModel(
    imageIntro: 'assets/images/intro_2.png',
    title: 'Find Events That Inspire You',
    details:
        "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
  ),
  OnboardingModel(
    imageIntro: 'assets/images/intro_3.png',
    title: 'Connect with Friends & Share Moments',
    details:
        'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
  ),
];
