class Student {
  final String name;
  final String imagePath;
  final List<String> skills;
  final String helpOffered;
  final String story;

  // Constructor
  Student({
    required this.name,
    required this.imagePath,
    required this.skills,
    required this.helpOffered,
    required this.story,
  });

  // Factory constructor to create a Student from JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] ?? '',
      imagePath: json['imagePath'] ?? '',
      skills: List<String>.from(json['skills'] ?? []),
      helpOffered: json['helpOffered'] ?? '',
      story: json['story'] ?? '',
    );
  }
}
