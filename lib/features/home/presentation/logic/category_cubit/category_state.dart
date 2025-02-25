part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> category;

  CategorySuccess({required this.category});
}

final class CategoryFailure extends CategoryState {
  final String errorMessage;

  CategoryFailure({required this.errorMessage});
}
