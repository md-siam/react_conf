class ConferenceModel {
  String id;
  String name;
  List<Conference> conferences;

  ConferenceModel({
    required this.id,
    required this.name,
    required this.conferences,
  });

  factory ConferenceModel.fromJson(Map<String, dynamic> json) =>
      ConferenceModel(
        id: json["id"],
        name: json["name"],
        conferences: List<Conference>.from(
            json["conferences"].map((x) => Conference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "conferences": List<dynamic>.from(conferences.map((x) => x.toJson())),
      };
}

class Conference {
  String id;
  String name;
  List<Schedule> schedules;

  Conference({
    required this.id,
    required this.name,
    required this.schedules,
  });

  factory Conference.fromJson(Map<String, dynamic> json) => Conference(
        id: json["id"],
        name: json["name"],
        schedules: List<Schedule>.from(
            json["schedules"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}

class Schedule {
  DateTime day;

  Schedule({
    required this.day,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: DateTime.parse(json["day"]),
      );

  Map<String, dynamic> toJson() => {
        "day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
      };
}
