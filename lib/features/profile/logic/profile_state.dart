import '../data/madels/profile_stats_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileStatsModel stats;

  ProfileSuccess(this.stats);
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}