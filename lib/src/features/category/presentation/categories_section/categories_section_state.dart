part of 'categories_section_controller.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  const CategoriesLoaded({required this.categories});

  final List<CategoryEntity> categories;

  @override
  List<Object> get props => [categories];
}

final class CategoriesError extends CategoriesState {
  const CategoriesError({required this.errorMsg});

  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}
