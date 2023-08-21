class ScheduleModel {
  String day;
  String description;
  List<Interval> intervals;

  ScheduleModel({
    required this.day,
    required this.description,
    required this.intervals,
  });

  factory ScheduleModel.fromJson({required Map<String, dynamic> json}) =>
      ScheduleModel(
        day: json["day"],
        description: json["description"],
        intervals: List<Interval>.from(
            json["intervals"].map((x) => Interval.fromJson(x))),
      );
}

class Interval {
  String begin;
  String end;
  dynamic title;
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
  String? description;

  Session({
    required this.type,
    required this.title,
    required this.description,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        type: json["type"],
        title: json["title"],
        description: json["description"],
      );
}
