import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_data.dart';
import '../../domain/usecases/get_home_data_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getHomeData) : super(const HomeLoading());

  final GetHomeDataUseCase _getHomeData;

  Future<void> load() async {
    emit(const HomeLoading());
    final result = await _getHomeData();
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (data) => emit(HomeLoaded(data)),
    );
  }

  /// Used by pull-to-refresh. Keeps showing the current data while the
  /// new fetch is in flight instead of flashing back to a loading
  /// skeleton, which would feel jarring for a manual refresh gesture.
  Future<void> refresh() async {
    final result = await _getHomeData();
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (data) => emit(HomeLoaded(data)),
    );
  }
}
