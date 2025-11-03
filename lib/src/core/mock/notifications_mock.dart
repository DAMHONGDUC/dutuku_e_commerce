import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';

class NotificationsMock {
  static List<NotificationEntity> generateMockNotifications() {
    DateTime minutesAgo(int minutes) {
      return DateTime.now().subtract(Duration(minutes: minutes));
    }

    return [
      // --- Order Updates ---
      NotificationEntity(
        id: 'n001',
        title: 'Order #3458 Shipped! 🚚',
        body:
            'Great news! Your recent order is now on its way. Track its progress now.',
        timestamp: minutesAgo(5),
        isRead: true,
        type: NotificationType.orderUpdate,
        relatedItemId: '3458',
      ),
      NotificationEntity(
        id: 'n002',
        title: 'Order #3457 Delivered!',
        body:
            'Your package was delivered successfully at 10:30 AM. Enjoy your items!',
        timestamp: minutesAgo(120), // 2 hours ago
        isRead: true, // Read
        type: NotificationType.orderUpdate,
        relatedItemId: '3457',
      ),

      // --- Promotions ---
      NotificationEntity(
        id: 'n003',
        title: 'Flash Sale: 50% Off! 🎉',
        body:
            'Don\'t miss our limited-time offer on all winter collection items. Shop before midnight!',
        timestamp: minutesAgo(30),
        isRead: false, // Unread
        type: NotificationType.promotion,
        relatedItemId: 'sale_winter',
      ),

      // --- New Product ---
      NotificationEntity(
        id: 'n004',
        title: 'New Arrival: Tech Gadgets 📱',
        body:
            'Check out the latest smartwatches and headphones added to our electronics category.',
        timestamp: minutesAgo(400), // ~6 hours ago
        isRead: false, // Unread
        type: NotificationType.newProduct,
        relatedItemId: 'cat_electronics',
      ),

      // --- Account Update ---
      NotificationEntity(
        id: 'n005',
        title: 'Password Changed Successfully',
        body:
            'Your account password was updated on November 3rd. If this wasn\'t you, contact support immediately.',
        timestamp: minutesAgo(1440), // 1 day ago
        isRead: true, // Read
        type: NotificationType.account,
        relatedItemId: 'account_security',
      ),

      // --- General/Misc ---
      NotificationEntity(
        id: 'n006',
        title: 'Welcome Back Bonus! 🎁',
        body:
            'We missed you! Here is a 10% off coupon just for coming back to our app.',
        timestamp: minutesAgo(2880), // 2 days ago
        isRead: true, // Read
        type: NotificationType.general,
        relatedItemId: 'coupon_welcome',
      ),
    ];
  }

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
}
