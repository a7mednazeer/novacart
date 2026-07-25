import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/domain/usecases/get_current_user_usecase.dart';
import '../../../auth/domain/usecases/update_profile_usecase.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._getCurrentUser, this._updateProfile)
      : super(const EditProfileLoading());

  final GetCurrentUserUseCase _getCurrentUser;
  final UpdateProfileUseCase _updateProfile;

  Future<void> load() async {
    emit(const EditProfileLoading());
    final result = await _getCurrentUser();

    result.fold(
      (failure) => emit(EditProfileError(failure.message)),
      (user) => user == null
          ? emit(const EditProfileError('No signed-in user found.'))
          : emit(EditProfileLoaded(user)),
    );
  }

  Future<void> save({required String fullName, String? phoneNumber}) async {
    final current = state;
    if (current is! EditProfileLoaded) return;

    emit(current.copyWith(isSaving: true));
    final result = await _updateProfile(fullName: fullName, phoneNumber: phoneNumber);

    result.fold(
      (failure) => emit(EditProfileError(failure.message)),
      (_) => emit(const EditProfileSaved()),
    );
  }
}
