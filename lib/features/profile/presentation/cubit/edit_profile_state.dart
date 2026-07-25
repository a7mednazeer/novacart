part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

class EditProfileLoading extends EditProfileState {
  const EditProfileLoading();
}

class EditProfileLoaded extends EditProfileState {
  const EditProfileLoaded(this.user, {this.isSaving = false});
  final UserEntity user;
  final bool isSaving;

  EditProfileLoaded copyWith({UserEntity? user, bool? isSaving}) {
    return EditProfileLoaded(user ?? this.user, isSaving: isSaving ?? this.isSaving);
  }

  @override
  List<Object?> get props => [user, isSaving];
}

class EditProfileSaved extends EditProfileState {
  const EditProfileSaved();
}

class EditProfileError extends EditProfileState {
  const EditProfileError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
