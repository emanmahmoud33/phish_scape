class ProfileStatsModel {
  final int securityScore;
  final String globalRank;
  final int detectionAccuracy;
  final int streak;
  final int testsCompleted;

  ProfileStatsModel({
    required this.securityScore,
    required this.globalRank,
    required this.detectionAccuracy,
    required this.streak,
    required this.testsCompleted,
  });

  factory ProfileStatsModel.fromJson(Map<String, dynamic> json) {
    return ProfileStatsModel(
      securityScore: json['securityScore'] ?? 0,
      globalRank: json['globalRank'] ?? "Top 0%",
      detectionAccuracy: json['detectionAccuracy'] ?? 0,
      streak: json['streak'] ?? 0,
      testsCompleted: json['testsCompleted'] ?? 0,
    );
  }
}