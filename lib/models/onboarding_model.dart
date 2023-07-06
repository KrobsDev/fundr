class OnboardingModel {
  final String image;
  final String title;
  final String text;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.text,
  });
}

final List<OnboardingModel> content = [
  OnboardingModel(
    image: 'assets/images/onboarding_1.jpg',
    title: 'Welcome to Fundr',
    text:
        'Connect and Make a Difference. Join our community of charitable organizations and individuals committed to creating positive change.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding_2.jpg',
    title: 'Discover Charitable Organizations',
    text:
        'Explore a wide range of charitable organizations and their impactful initiatives. Find causes that resonate with you.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding_3.jpg',
    title: 'Support Your Favorite Causes',
    text:
        'Donate to the charities and causes that inspire you. Every contribution helps make a difference in the lives of others.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding_4.jpg',
    title: 'Connect and Collaborate',
    text:
        'Network with other charitable organizations, share insights, and collaborate on joint initiatives. Together, we can achieve more.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding_5.jpg',
    title: 'Get Started!',
    text:
        'Create your account and embark on a journey of meaningful connections, fundraising, and making a difference. Let\'s work together for a better world.',
  ),
];
