import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../checkout/presentation/cubit/address_management_cubit.dart';
import '../../../checkout/presentation/widgets/add_address_sheet.dart';
import '../../../checkout/presentation/widgets/address_card.dart';

class ManageAddressesPage extends StatelessWidget {
  const ManageAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AddressManagementCubit>()..loadAddresses(),
      child: const _ManageAddressesView(),
    );
  }
}

class _ManageAddressesView extends StatelessWidget {
  const _ManageAddressesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Addresses')),
      body: BlocBuilder<AddressManagementCubit, AddressManagementState>(
        builder: (context, state) {
          final cubit = context.read<AddressManagementCubit>();

          if (state is AddressManagementLoading) {
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: List.generate(
                3,
                (_) => const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.sm),
                  child: ShimmerBox(height: 90),
                ),
              ),
            );
          }

          if (state is AddressManagementError) {
            return ErrorStateView(
              message: state.message,
              onRetry: cubit.loadAddresses,
            );
          }

          final addresses = (state as AddressManagementLoaded).addresses;

          return Column(
            children: [
              Expanded(
                child: addresses.isEmpty
                    ? EmptyStateView(
                        icon: Icons.location_on_outlined,
                        title: 'No saved addresses',
                        message: 'Add a shipping address to speed up checkout next time.',
                      )
                    : ListView(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        children: addresses.map((address) {
                          return Dismissible(
                            key: ValueKey(address.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: AppSpacing.lg),
                              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                              decoration: BoxDecoration(
                                color: AppColors.error,
                                borderRadius: BorderRadius.circular(AppRadius.lg),
                              ),
                              child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
                            ),
                            onDismissed: (_) => cubit.deleteAddress(address.id),
                            child: AddressCard(
                              address: address,
                              isSelected: address.isDefault,
                              onTap: () => cubit.setDefault(address.id),
                            ),
                          );
                        }).toList(),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: OutlinedButton.icon(
                  onPressed: () => showAddAddressSheet(
                    context,
                    onSubmit: ({
                      required fullName,
                      required phone,
                      required addressLine,
                      required city,
                    }) =>
                        cubit.addAddress(
                      fullName: fullName,
                      phone: phone,
                      addressLine: addressLine,
                      city: city,
                    ),
                  ),
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('Add New Address'),
                  style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
