import 'dart:math';

import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class NotificationsMock {
  static List<NotificationCategory> generateMockCategories() {
    return [
      NotificationCategory(
        name: 'Promotions',
        description: 'Updates on deals and vouchers',
        icon: Icons.local_offer,
        type: NotificationCategoryType.promotion,
        numOfNotifications: 3,
      ),
      NotificationCategory(
        name: 'Live & Video',
        description: 'Updates from Live Streams and video content',
        icon: Icons.live_tv,
        type: NotificationCategoryType.liveVideo,
        numOfNotifications: 0,
      ),
      NotificationCategory(
        name: 'Financial Info',
        description: 'Balance changes and refund status',
        icon: Icons.account_balance_wallet,
        type: NotificationCategoryType.financial,
        numOfNotifications: 1,
      ),
      NotificationCategory(
        name: 'Updates',
        description: 'News, policies, and system announcements',
        icon: Icons.info,
        type: NotificationCategoryType.update,
        numOfNotifications: 5,
      ),
      NotificationCategory(
        name: 'Awards',
        description: 'Sweepstakes and contest winning announcements',
        icon: Icons.emoji_events,
        type: NotificationCategoryType.award,
        numOfNotifications: 0,
      ),
    ];
  }

  static List<NotificationEntity> generateMockNotifications({int count = 20}) {
    final random = Random();
    final uuid = const Uuid();

    // === Order-related notifications ===
    final orderTitles = [
      'Order Confirmed',
      'Order Shipped',
      'Order Delivered',
      'Order Cancelled',
      'Payment Received',
    ];
    final orderBodies = [
      'Your order #{id} has been confirmed and is being processed.',
      'Order #{id} has been shipped. Track it in your order history.',
      'Order #{id} was successfully delivered. Enjoy your purchase!',
      'We’re sorry, your order #{id} has been cancelled.',
      'Payment for order #{id} has been received successfully.',
    ];

    // === Promotion notifications ===
    final promoTitles = [
      'Flash Sale Alert ⚡️',
      'Weekend Mega Deal',
      'Exclusive Member Offer',
      'Limited-Time Discount',
      'Buy 2 Get 1 Free!',
    ];
    final promoBodies = [
      'Hurry! Get up to 70% off on selected items today only!',
      'Enjoy 30% off sitewide this weekend only!',
      'As our valued member, enjoy an extra 15% off your next order.',
      'Your limited-time discount is waiting — shop before midnight!',
      'Buy any 2 items and get the 3rd one for free. Don’t miss out!',
    ];

    // === New product notifications ===
    final productTitles = [
      'New Collection Just Dropped 👕',
      'Check Out Our Latest Gadgets',
      'Brand-New Arrivals Are Here!',
      'Trending Now: Fresh Styles',
      'Your Favorite Brand’s New Line',
    ];
    final productBodies = [
      'Explore our new Summer Collection — available now!',
      'Discover the latest smart gadgets in store today.',
      'Brand-new arrivals are waiting for you. Shop the trend!',
      'New streetwear styles just dropped. Limited stock!',
      'Your favorite brand just released new items. Check them out!',
    ];

    // === Account notifications ===
    final accountTitles = [
      'Welcome to Dutuku 🎉',
      'Password Changed Successfully',
      'Verify Your Email Address',
      'Account Update Notice',
      'Security Alert',
    ];
    final accountBodies = [
      'Thanks for joining Dutuku! Let’s start shopping!',
      'Your password was changed successfully. If this wasn’t you, reset it now.',
      'Please verify your email to activate your account.',
      'We’ve updated our Terms of Service. Review them in your account settings.',
      'Suspicious login detected. Please confirm it was you.',
    ];

    // === General notifications ===
    final generalTitles = [
      'App Update Available',
      'We Value Your Feedback',
      'System Maintenance Scheduled',
      'You Earned Reward Points 🎁',
      'Survey: Tell Us What You Think',
    ];
    final generalBodies = [
      'A new version of our app is available. Update now for the best experience.',
      'Your opinion matters! Leave feedback to help us improve.',
      'Scheduled maintenance tonight from 1:00–3:00 AM.',
      'You just earned 150 reward points. Redeem them today!',
      'Take a quick survey and get a discount code as a thank you!',
    ];

    final types = NotificationType.values;

    return List.generate(count, (index) {
      final type = types[random.nextInt(types.length)];
      final isRead = index == 0 ? true : random.nextBool();
      final timestamp = DateTime.now().subtract(
        Duration(minutes: random.nextInt(60 * 24 * 30)), // up to 30 days old
      );
      final relatedId = uuid.v4();
      final id = uuid.v4();

      String title;
      String body;

      switch (type) {
        case NotificationType.orderUpdate:
          final i = random.nextInt(orderTitles.length);
          title = orderTitles[i];
          body = orderBodies[i].replaceAll('{id}', relatedId.substring(0, 6));
          break;
        case NotificationType.promotion:
          final i = random.nextInt(promoTitles.length);
          title = promoTitles[i];
          body = promoBodies[i];
          break;
        case NotificationType.newProduct:
          final i = random.nextInt(productTitles.length);
          title = productTitles[i];
          body = productBodies[i];
          break;
        case NotificationType.account:
          final i = random.nextInt(accountTitles.length);
          title = accountTitles[i];
          body = accountBodies[i];
          break;
        case NotificationType.general:
          final i = random.nextInt(generalTitles.length);
          title = generalTitles[i];
          body = generalBodies[i];
          break;
      }

      return NotificationEntity(
        id: id,
        title: title,
        body: body,
        timestamp: timestamp,
        isRead: isRead,
        type: type,
        relatedItemId: type == NotificationType.orderUpdate ? relatedId : null,
      );
    });
  }
}
