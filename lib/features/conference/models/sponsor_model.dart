class SponsorModel {
  String name;
  Social social;
  String about;
  SponsorImage image;

  SponsorModel({
    required this.name,
    required this.social,
    required this.about,
    required this.image,
  });

  factory SponsorModel.fromJson({required Map<String, dynamic> json}) =>
      SponsorModel(
        name: json["name"],
        social: Social.fromJson(json["social"]),
        about: json["about"],
        image: SponsorImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "social": social.toJson(),
        "about": about,
        "image": image.toJson(),
      };
}

class SponsorImage {
  String url;

  SponsorImage({
    required this.url,
  });

  factory SponsorImage.fromJson(Map<String, dynamic> json) => SponsorImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Social {
  String homepage;

  Social({
    required this.homepage,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        homepage: json["homepage"],
      );

  Map<String, dynamic> toJson() => {
        "homepage": homepage,
      };
}
