import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/presentation/logic/category_cubit/category_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/categories_list.dart';

class GetCategoryBlobBuilder extends StatelessWidget {
  const GetCategoryBlobBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryFailure) {
          return Text('Failed to load categories');
        } else if (state is CategorySuccess) {
          return CategoriesList(categories: state.category);
        } else if (state is CategoryLoading) {
          return Column(
            children: [
              Center(child: CircularProgressIndicator()),
              SizedBox(
                height: 20.h,
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
