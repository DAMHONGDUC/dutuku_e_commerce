import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/presentation/profile/components/setting_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

import 'components/profile_app_bar.dart';
import 'profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProfileController>()..getData()),
      ],
      child: _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  Future _onRefresh(BuildContext context) async {
    context.read<ProfileController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.pageDefault,
      contentBgColor: context.colorTheme.pageDefault,
      appBar: ProfileAppBar(),
      child: BlocConsumer<ProfileController, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        buildWhen: (previous, current) {
          return current is ProfileLoadingState ||
              current is ProfileLoadedState;
        },
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return _ProfileSkeleton();
          } else if (state is ProfileLoadedState) {
            return RefreshWrapper(
              onRefresh: () => _onRefresh(context),
              child: SdListView(
                padding: EdgeInsets.all(SdSpacing.s16),
                items: state.listSettingSection,
                separatorBuilder: (context, index) {
                  return SdVerticalSpacing();
                },
                itemBuilder: (_, index) {
                  return SettingSection(
                    settingSection: state.listSettingSection[index],
                  );
                },
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}

class _ProfileSkeleton extends StatelessWidget {
  const _ProfileSkeleton();

  @override
  Widget build(BuildContext context) {
    return SdListView(
      padding: EdgeInsets.all(SdSpacing.s16),
      items: List.generate(10, (e) => e),
      separatorBuilder: (context, index) {
        return SdVerticalSpacing();
      },
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            color: context.colorTheme.cardDefault,
            borderRadius: BorderRadius.all(Radius.circular(SdSpacing.s12)),
          ),
          padding: EdgeInsets.all(SdSpacing.s12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SdSkeleton(width: 50),
              SdVerticalSpacing(xRatio: 0.5),
              SdSkeleton(width: 100),
            ],
          ),
        );
      },
    );
  }
}
