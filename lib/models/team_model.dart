class TeamMember {
  final String name;
  final String role;
  final String bio;
  final String imageUrl;
  final String linkedinUrl;
  final String facebookUrl;

  TeamMember({
    required this.name,
    required this.role,
    required this.bio,
    required this.imageUrl,
    required this.linkedinUrl,
    required this.facebookUrl,
  });

  Uri getLinkedin() => Uri.parse(linkedinUrl);

  Uri getFacebook() => Uri.parse(facebookUrl);
}
