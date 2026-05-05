class DashboardModel {
  final int totalXp;
  final int currentXp;
  final double percentage;

  DashboardModel({
    required this.totalXp,
    required this.currentXp,
    required this.percentage,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      totalXp: json["totalXp"],
      currentXp: json["currentXp"],
      percentage: json["percentage"],
    );
  }
}