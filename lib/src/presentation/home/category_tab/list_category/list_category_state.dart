part of 'list_category_controller.dart';

sealed class ListCategoryState extends Equatable {
  const ListCategoryState();

  @override
  List<Object> get props => [];
}

final class ListCategoryInitial extends ListCategoryState {}

final class ListCategoryLoading extends ListCategoryState {}

final class ListCategoryLoaded extends ListCategoryState {
  const ListCategoryLoaded({required this.categories});

  final List<Category> categories;
}
