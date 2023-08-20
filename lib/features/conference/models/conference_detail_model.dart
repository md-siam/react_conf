class ConferenceDetailModel {
  DateTime day;
  String description;
  List<Interval> intervals;

  ConferenceDetailModel({
    required this.day,
    required this.description,
    required this.intervals,
  });

  factory ConferenceDetailModel.fromJson(Map<String, dynamic> json) =>
      ConferenceDetailModel(
        day: DateTime.parse(json["day"]),
        description: json["description"],
        intervals: List<Interval>.from(
            json["intervals"].map((x) => Interval.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "description": description,
        "intervals": List<dynamic>.from(intervals.map((x) => x.toJson())),
      };
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

  Map<String, dynamic> toJson() => {
        "begin": begin,
        "end": end,
        "title": title,
        "sessions": List<dynamic>.from(sessions.map((x) => x.toJson())),
      };
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

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "description": description,
        "people": people == null
            ? []
            : List<dynamic>.from(people!.map((x) => x.toJson())),
      };
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

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image.toJson(),
      };
}

class Image {
  String url;

  Image({
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
