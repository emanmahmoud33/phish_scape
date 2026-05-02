import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/auth_service.dart';
import '../../data/models/user_model.dart';

/// ================= STATES =================
UserModel? currentUser;
String? currentImage;
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

/// 🟢 بيانات المستخدم
class UserSuccess extends UserState {
  final UserModel user;
  UserSuccess(this.user);
}

/// 🟢 الصورة
class UserImageLoaded extends UserState {
  final String imageUrl;
  UserImageLoaded(this.imageUrl);
}

/// ❌ error
class UserError extends UserState {
  final String error;
  UserError(this.error);
}

/// ================= CUBIT =================

class UserCubit extends Cubit<UserState> {

  final AuthService service;

  UserCubit(this.service) : super(UserInitial());

  /// 📌 get user (name, email)
  Future<void> getUser() async {
    try {
      final user = await service.getMe();
      currentUser = user;

      emit(UserDataState(user: currentUser, image: currentImage));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }


  Future<void> getUserImage() async {
    try {
      final image = await service.getProfileImage();
      currentImage = image;

      emit(UserDataState(user: currentUser, image: currentImage));
    } catch (e) {
      emit(UserError("Failed to load image"));
    }
  }

}
class UserDataState extends UserState {
  final UserModel? user;
  final String? image;

  UserDataState({this.user, this.image});
}