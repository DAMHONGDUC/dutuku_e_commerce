import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:equatable/equatable.dart';

class ReviewAsset extends Equatable {
  final String url;
  final AssetType type;

  const ReviewAsset({required this.url, required this.type});

  @override
  List<Object?> get props => [url, type];
}

class ReviewComment extends Equatable {
  final int id;
  final String userName;
  final String comment;
  final double rating;
  final DateTime createdAt;
  final List<ReviewAsset> assets;

  const ReviewComment({
    required this.id,
    required this.userName,
    required this.comment,
    required this.rating,
    required this.createdAt,
    this.assets = const [],
  });

  @override
  List<Object?> get props => [id, userName, comment, rating, createdAt, assets];
}
