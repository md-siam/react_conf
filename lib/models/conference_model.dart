class ConferenceModel {
  final String? id;
  final String name;
  final List conferences;

  ConferenceModel({
    this.id,
    required this.name,
    required this.conferences,
  });

  static ConferenceModel fromMap({required Map map}) => ConferenceModel(
        id: map['_id'],
        name: map['name'],
        conferences: map['conferences'],
      );
}
