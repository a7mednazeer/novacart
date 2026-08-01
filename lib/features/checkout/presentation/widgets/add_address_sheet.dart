import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../generated/l10n/app_localizations.dart';

/// Returns `true` if an address was successfully added, via [onSubmit].
Future<void> showAddAddressSheet(
  BuildContext context, {
  required Future<bool> Function({
    required String fullName,
    required String phone,
    required String addressLine,
    required String city,
  }) onSubmit,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
    ),
    builder: (context) => _AddAddressSheet(onSubmit: onSubmit),
  );
}

class _AddAddressSheet extends StatefulWidget {
  const _AddAddressSheet({required this.onSubmit});

  final Future<bool> Function({
    required String fullName,
    required String phone,
    required String addressLine,
    required String city,
  }) onSubmit;

  @override
  State<_AddAddressSheet> createState() => _AddAddressSheetState();
}

class _AddAddressSheetState extends State<_AddAddressSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);
    final success = await widget.onSubmit(
      fullName: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      addressLine: _addressController.text.trim(),
      city: _cityController.text.trim(),
    );
    if (!mounted) return;
    setState(() => _isSubmitting = false);
    if (success) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.addNewAddress,
                style: AppTextStyles.h2(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppTextField(
                label: l10n.fullNameLabel,
                controller: _nameController,
                prefixIcon: Icons.person_outline_rounded,
                validator: Validators.fullName,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                label: l10n.phoneNumberLabel,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_outlined,
                validator: Validators.phone,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                label: l10n.stepAddressLabel,
                hint: l10n.addressHintLabel,
                controller: _addressController,
                prefixIcon: Icons.home_outlined,
                validator: (v) => Validators.required(v, field: l10n.stepAddressLabel),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                label: l10n.cityLabel,
                controller: _cityController,
                prefixIcon: Icons.location_city_outlined,
                validator: (v) => Validators.required(v, field: l10n.cityLabel),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: l10n.saveAddressLabel,
                isLoading: _isSubmitting,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
