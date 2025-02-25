import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/category_news/presentation/logic/show_article_by_category_cubit/show_article_by_category_cubit.dart';
import 'package:news_app/features/home/data/datasources/news.dart';
import 'package:news_app/features/onboarding/presentation/screens/on_boarding.dart';
import 'features/home/presentation/logic/article_cubit/articles_cubit.dart';
import 'features/home/presentation/logic/category_cubit/category_cubit.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArticlesCubit(News())..getNews(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..getCategories(),
        ),
        BlocProvider(
          create: (context) => ShowArticleByCategoryCubit(),
        )
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: OnBoardingScreen(),
        ),
      ),
    );
  }
}
