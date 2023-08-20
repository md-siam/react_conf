class SpeakerModel {
  String name;
  String about;
  Social social;
  SpeakersImage image;
  Country? country;

  SpeakerModel({
    required this.name,
    required this.about,
    required this.social,
    required this.image,
    required this.country,
  });

  factory SpeakerModel.fromJson({required Map<String, dynamic> json}) =>
      SpeakerModel(
        name: json["name"],
        about: json["about"],
        social: Social.fromJson(json["social"]),
        image: SpeakersImage.fromJson(json["image"]),
        country: Country.fromJson(json["country"]),
      );
}

class Country {
  String? code;

  Country({
    required this.code,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
      );
}

class SpeakersImage {
  String? url;

  SpeakersImage({
    required this.url,
  });

  factory SpeakersImage.fromJson(Map<String, dynamic> json) => SpeakersImage(
        url: json["url"],
      );
}

class Social {
  String? homepage;
  String? github;
  String? twitter;
  String? linkedin;

  Social({
    required this.homepage,
    required this.github,
    required this.twitter,
    required this.linkedin,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        homepage: json["homepage"],
        github: json["github"],
        twitter: json["twitter"],
        linkedin: json["linkedin"],
      );
}
