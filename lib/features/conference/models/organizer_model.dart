class OrganizerModel {
  String name;
  Social social;
  String about;
  OrganizerImage image;

  OrganizerModel({
    required this.name,
    required this.social,
    required this.about,
    required this.image,
  });

  factory OrganizerModel.fromJson({required Map<String, dynamic> json}) =>
      OrganizerModel(
        name: json["name"],
        social: Social.fromJson(json["social"]),
        about: json["about"],
        image: OrganizerImage.fromJson(json["image"]),
      );
}

class OrganizerImage {
  String url;

  OrganizerImage({
    required this.url,
  });

  factory OrganizerImage.fromJson(Map<String, dynamic> json) => OrganizerImage(
        url: json["url"],
      );
}

class Social {
  String homepage;

  Social({
    required this.homepage,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        homepage: json["homepage"],
      );
}
