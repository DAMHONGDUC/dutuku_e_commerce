import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';
import 'package:dutuku_e_commerce/src/domain/usecases/get_profile_settings_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/utils/utils.dart';

part 'profile_state.dart';

class ProfileController extends Cubit<ProfileState> {
  ProfileController(this._getProfileSettingsUsecase) : super(ProfileInitial());

  final GetProfileSettingsUsecase _getProfileSettingsUsecase;

  Future getData() async {
    emit(ProfileLoadingState());
    await SdHelper.delayLoading();

    final result = await _getProfileSettingsUsecase.call(NoParams());

    result.fold(
      (l) {
        // TODO: imp error case
      },
      (r) {
        emit(ProfileLoadedState(listSettingSection: r));
      },
    );
  }
}
