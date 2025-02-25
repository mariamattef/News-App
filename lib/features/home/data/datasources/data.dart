import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';

import '../models/category_model.dart';

Future<Either<Failure, List<CategoryModel>>> getCategory() async {
  try {
    List<CategoryModel> category = [];
    CategoryModel categoryModel = CategoryModel();
    categoryModel.categoryName = 'Business';
    categoryModel.imgUrl = 'assets/images/business.jpg';
    category.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.categoryName = 'Entertainment';
    categoryModel.imgUrl = 'assets/images/entertainment.jpg';
    category.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.categoryName = 'Science';
    categoryModel.imgUrl = 'assets/images/science.jpg';
    category.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.categoryName = 'Sports';
    categoryModel.imgUrl = 'assets/images/sports.jpg';
    category.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.categoryName = 'Technology';
    categoryModel.imgUrl = 'assets/images/technology.jpg';
    category.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.categoryName = 'Health';
    categoryModel.imgUrl = 'assets/images/health.webp';
    category.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.categoryName = 'General';
    categoryModel.imgUrl = 'assets/images/general.jpeg';
    category.add(categoryModel);
    return Right(category);
  } catch (e) {
    return Left(Failure(errMessage: e.toString()));
  }
}
// health
