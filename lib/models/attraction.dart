class Attraction {
  int id;
  String objectName;
  String location;
  // final String audioPath;
  String content;

  Attraction({
    required this.id,
    required this.objectName,
    required this.location,
    // required this.audioPath,
    required this.content,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
        id: json['id'],
        objectName: json['object_name'],
        location: json['location'],
        // audioPath: json['audio'],
        content: json['content']);
  }
}
