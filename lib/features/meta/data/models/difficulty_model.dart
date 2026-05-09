class DifficultyModel {

  final int id;

  final String name;

  DifficultyModel({

    required this.id,

    required this.name,
  });

  factory DifficultyModel.fromJson(
      Map<String, dynamic> json,
      ) {

    return DifficultyModel(

      id: json["id"],

      name: json["name"],
    );
  }
}