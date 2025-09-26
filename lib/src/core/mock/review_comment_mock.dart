import 'dart:math';

import 'package:dutuku_e_commerce/src/domain/domain.dart';

class ReviewCommentMock {
  static final _random = Random();

  static final _names = [
    'Alice',
    'Bob',
    'Clara',
    'David',
    'Ethan',
    'Fiona',
    'George',
    'Hana',
    'Ivy',
    'Jack',
  ];

  static final _comments = [
    'Great quality, worth the price!',
    'Really stylish and durable.',
    'Perfect size for my needs.',
    'Looks good but could be stronger.',
    'Comfortable and lightweight.',
    'Material feels premium.',
    'Nice design but a bit pricey.',
    'Color is vibrant and beautiful.',
    'Exactly as described, love it!',
    'Could be improved with more pockets.',
  ];

  /// Generate a list of random review comments
  static List<ReviewComment> generateRandomReviews(int count) {
    return List.generate(count, (index) {
      final name = _names[_random.nextInt(_names.length)];
      final comment = _comments[_random.nextInt(_comments.length)];
      final rating = (_random.nextDouble() * 2) + 3; // rating từ 3.0 -> 5.0
      final daysAgo = _random.nextInt(365);
      final date = DateTime.now().subtract(Duration(days: daysAgo));

      return ReviewComment(
        id: index + 1,
        userName: name,
        comment: comment,
        rating: double.parse(rating.toStringAsFixed(1)),
        createdAt: date,
      );
    });
  }
}
