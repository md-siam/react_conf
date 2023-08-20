class ConferenceDetailModel {
  String day;
  String description;
  List<Interval> intervals;

  ConferenceDetailModel({
    required this.day,
    required this.description,
    required this.intervals,
  });

  factory ConferenceDetailModel.fromJson(
          {required Map<String, dynamic> json}) =>
      ConferenceDetailModel(
        day: json["day"],
        description: json["description"],
        intervals: List<Interval>.from(
            json["intervals"].map((x) => Interval.fromJson(x))),
      );
}

class Interval {
  String begin;
  String end;
  String? title;
  List<Session> sessions;

  Interval({
    required this.begin,
    required this.end,
    required this.title,
    required this.sessions,
  });

  factory Interval.fromJson(Map<String, dynamic> json) => Interval(
        begin: json["begin"],
        end: json["end"],
        title: json["title"],
        sessions: List<Session>.from(
            json["sessions"].map((x) => Session.fromJson(x))),
      );
}

class Session {
  String type;
  String title;
  String description;
  List<Person>? people;

  Session({
    required this.type,
    required this.title,
    required this.description,
    required this.people,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        type: json["type"],
        title: json["title"],
        description: json["description"],
        people: json["people"] == null
            ? []
            : List<Person>.from(json["people"]!.map((x) => Person.fromJson(x))),
      );
}

class Person {
  String name;
  Image image;

  Person({
    required this.name,
    required this.image,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        image: Image.fromJson(json["image"]),
      );
}

class Image {
  String url;

  Image({
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );
}
