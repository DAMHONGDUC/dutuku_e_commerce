import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/notificartions/components/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'components/notification_app_bar.dart';
import 'components/notification_category_card.dart';

final List<NotificationEntity> _dataNoti =
    NotificationsMock.generateMockNotifications();
final List<NotificationCategory> _dataNotiCategory =
    NotificationsMock.generateMockCategories();

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.pageDefault,
      contentBgColor: context.colorTheme.pageDefault,
      appBar: NotificationAppBar(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SdSpacing.s12),
        child: ListView(
          children: [
            SdListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              items: _dataNotiCategory,
              separatorBuilder: (context, index) {
                return SdDivider();
              },
              itemBuilder: (context, index) {
                return NotificationCategoryCard(
                  category: _dataNotiCategory[index],
                  onTap: () {},
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(SdSpacing.s12),
              child: SectionHeader(
                title: 'Order update information',
                hasBottomSpacing: false,
              ),
            ),
            SdListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              items: _dataNoti,
              separatorBuilder: (context, index) {
                return SdDivider();
              },
              itemBuilder: (_, index) {
                return NotificationCard(
                  notification: _dataNoti[index],
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
