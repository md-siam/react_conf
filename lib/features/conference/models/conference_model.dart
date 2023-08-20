class ConferenceModel {
  String id;
  String name;
  List<Conference> conferences;

  ConferenceModel({
    required this.id,
    required this.name,
    required this.conferences,
  });

  factory ConferenceModel.fromJson({required Map<String, dynamic> json}) =>
      ConferenceModel(
        id: json["id"],
        name: json["name"],
        conferences: List<Conference>.from(
            json["conferences"].map((x) => Conference.fromJson(x))),
      );
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
}

class Schedule {
  String day;

  Schedule({
    required this.day,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: json["day"],
      );
}
