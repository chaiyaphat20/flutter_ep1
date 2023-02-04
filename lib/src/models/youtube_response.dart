import 'dart:convert';

Youtube youtubeFromJson(String str) => Youtube.fromJson(json.decode(str));

String youtubeToJson(Youtube data) => json.encode(data.toJson());

class Youtube {
  Youtube({
    required this.youtubes,
    required this.error,
    required this.errorMsg,
  });

  final List<YoutubeElement> youtubes;
  final bool error;
  final String errorMsg;

  factory Youtube.fromJson(Map<String, dynamic> json) => Youtube(
        youtubes: List<YoutubeElement>.from(
            json["youtubes"].map((x) => YoutubeElement.fromJson(x))),
        error: json["error"],
        errorMsg: json["error_msg"],
      );

  Map<String, dynamic> toJson() => {
        "youtubes": List<dynamic>.from(youtubes.map((x) => x.toJson())),
        "error": error,
        "error_msg": errorMsg,
      };
}

class YoutubeElement {
  YoutubeElement({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.avatarImage,
    required this.youtubeImage,
  });

  final String id;
  final String title;
  final String subtitle;
  final String avatarImage;
  final String youtubeImage;

  factory YoutubeElement.fromJson(Map<String, dynamic> json) => YoutubeElement(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        avatarImage: json["avatar_image"],
        youtubeImage: json["youtube_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "avatar_image": avatarImage,
        "youtube_image": youtubeImage,
      };
}
