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
  String slogan;
  String startDate;

  Conference({
    required this.id,
    required this.name,
    required this.slogan,
    required this.startDate,
  });

  factory Conference.fromJson(Map<String, dynamic> json) => Conference(
        id: json["id"],
        name: json["name"],
        slogan: json["slogan"],
        startDate: json["startDate"],
      );
}
