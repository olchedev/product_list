import 'package:flutter/material.dart';
import 'package:product_list/pages/product_list/product_list_page.dart';
import 'package:product_list/utils/app_colors.dart';
import 'package:product_list/utils/app_dimensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBlue,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.deepDarkBlue,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: AppColors.darkBlue,
            fontSize: AppDimensions.textSize,
            fontWeight: FontWeight.w600,
            letterSpacing: AppDimensions.t,
          ),
          headline2: TextStyle(
            color: AppColors.red,
            fontWeight: FontWeight.bold,
            fontSize: AppDimensions.textSize,
          ),
          headline3: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: AppDimensions.textSize,
          ),
          headline4: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.bold,
            fontSize: AppDimensions.textSize,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.yellow,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimensions.elevatedButtonRadius,
                ),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(
                vertical: AppDimensions.elevatedButtonNameVerticalPadding,
                horizontal: AppDimensions.elevatedButtonNameHorizontalPadding,
              ),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                color: AppColors.white,
                fontSize: AppDimensions.elevatedButtonNameSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      home: const ProductListPage(),
    );
  }
}
