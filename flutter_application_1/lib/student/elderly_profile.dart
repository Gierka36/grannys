class ElderlyProfile {
  final String name;
  final String imagePath;
  final List<String> skills;
  final String helpOffered;
  final String story;

  ElderlyProfile({
    required this.name,
    required this.imagePath,
    required this.skills,
    required this.helpOffered,
    required this.story,
  });

  // Factory constructor to create an ElderlyProfile from JSON
  factory ElderlyProfile.fromJson(Map<String, dynamic> json) {
    return ElderlyProfile(
      name: json['name'],
      imagePath: json['imagePath'],
      skills: List<String>.from(json['skills']),
      helpOffered: json['helpOffered'],
      story: json['story'],
    );
  }
}
