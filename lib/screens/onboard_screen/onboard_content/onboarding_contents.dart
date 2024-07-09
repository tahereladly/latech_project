class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "The best tech market",
    image: "assets/images/onboard_2.png",
    desc: "",
  ),
  OnboardingContents(
    title: "A lot of exclusives",
    image: "assets/images/onboard_3.png",
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Sales all the time",
    image: "assets/images/onboard_4.png",
    desc: "Take control of notifications, collaborate live or on your own time.",
  ),
];
