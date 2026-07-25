import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../cubit/edit_profile_cubit.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EditProfileCubit>()..load(),
      child: const _EditProfileView(),
    );
  }
}

class _EditProfileView extends StatefulWidget {
  const _EditProfileView();

  @override
  State<_EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<_EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _prefilled = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSaved) {
            AppSnackBar.showSuccess(context, 'Profile updated');
            Navigator.of(context).pop();
          } else if (state is EditProfileError) {
            AppSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is EditProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EditProfileError) {
            return ErrorStateView(
              message: state.message,
              onRetry: () => context.read<EditProfileCubit>().load(),
            );
          }

          if (state is EditProfileLoaded && !_prefilled) {
            _nameController.text = state.user.fullName;
            _phoneController.text = state.user.phoneNumber ?? '';
            _prefilled = true;
          }

          final isSaving = state is EditProfileLoaded && state.isSaving;

          return Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextField(
                    label: 'Full Name',
                    controller: _nameController,
                    prefixIcon: Icons.person_outline_rounded,
                    validator: Validators.fullName,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    label: 'Phone Number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone_outlined,
                    validator: Validators.phone,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppButton(
                    label: 'Save Changes',
                    isLoading: isSaving,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      context.read<EditProfileCubit>().save(
                            fullName: _nameController.text.trim(),
                            phoneNumber: _phoneController.text.trim(),
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
