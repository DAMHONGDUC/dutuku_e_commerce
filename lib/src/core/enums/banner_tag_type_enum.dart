import 'package:flutter/material.dart';

enum BannerTagTypeEnum { discount, newArrival, limited, hot, defaultTag }

extension BannerTagTypeExt on BannerTagTypeEnum {
  Color get color {
    switch (this) {
      case BannerTagTypeEnum.discount:
        return Colors.redAccent;
      case BannerTagTypeEnum.newArrival:
        return Colors.green;
      case BannerTagTypeEnum.limited:
        return Colors.orange;
      case BannerTagTypeEnum.hot:
        return Color(0xFFFF5722);
      case BannerTagTypeEnum.defaultTag:
        return Colors.grey;
    }
  }

  String get label {
    switch (this) {
      case BannerTagTypeEnum.discount:
        return 'Discount';
      case BannerTagTypeEnum.newArrival:
        return 'New';
      case BannerTagTypeEnum.limited:
        return 'Limited';
      case BannerTagTypeEnum.hot:
        return 'Hot';
      case BannerTagTypeEnum.defaultTag:
        return 'Promo';
    }
  }
}
