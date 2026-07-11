import 'package:equatable/equatable.dart';

class Description extends Equatable {
  final String content;
  final List<String> images;

  const Description({required this.content, this.images = const []});

  @override
  List<Object?> get props => [content, images];
}
