import 'package:equatable/equatable.dart';

class ReviewComment extends Equatable {
  final int id;
  final String userName;
  final String comment;
  final double rating;
  final DateTime createdAt;

  const ReviewComment({
    required this.id,
    required this.userName,
    required this.comment,
    required this.rating,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, userName, comment, rating, createdAt];
}
