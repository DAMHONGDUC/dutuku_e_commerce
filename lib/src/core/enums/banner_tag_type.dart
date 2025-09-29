import 'package:flutter/material.dart';

enum BannerTagType { discount, newArrival, limited, hot, defaultTag }

extension BannerTagTypeExt on BannerTagType {
  Color get color {
    switch (this) {
      case BannerTagType.discount:
        return Colors.redAccent;
      case BannerTagType.newArrival:
        return Colors.green;
      case BannerTagType.limited:
        return Colors.orange;
      case BannerTagType.hot:
        return Color(0xFFFF5722);
      case BannerTagType.defaultTag:
        return Colors.grey;
    }
  }

  String get label {
    switch (this) {
      case BannerTagType.discount:
        return 'Discount';
      case BannerTagType.newArrival:
        return 'New';
      case BannerTagType.limited:
        return 'Limited';
      case BannerTagType.hot:
        return 'Hot';
      case BannerTagType.defaultTag:
        return 'Promo';
    }
  }
}
