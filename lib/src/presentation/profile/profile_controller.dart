import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/utils/utils.dart';

part 'profile_state.dart';

class ProfileController extends Cubit<ProfileState> {
  ProfileController() : super(ProfileInitial());

  Future getData() async {
    emit(ProfileLoadingState());
    await SdHelper.delayLoading();
    emit(
      ProfileLoadedState(listSettingSection: ProfileMock.listSettingSection),
    );
  }
}
