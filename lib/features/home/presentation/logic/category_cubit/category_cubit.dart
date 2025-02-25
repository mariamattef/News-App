import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/data/datasources/data.dart';

import '../../../data/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
       await Future.delayed(Duration(seconds: 3));
      Either<Failure, List<CategoryModel>> category = await getCategory();
      category.fold((error) {
        emit(CategoryFailure(errorMessage: error.errMessage));
      }, (category) {
        emit(CategorySuccess(category: category));
      });
    } catch (e) {
      emit(CategoryFailure(errorMessage: 'Faild to get category'));
    }
  }
}
