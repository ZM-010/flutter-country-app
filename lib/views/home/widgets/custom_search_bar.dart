import 'package:arz8_task/controllers/home_controller.dart';
import 'package:arz8_task/utils/app_colors.dart';
import 'package:arz8_task/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final bool isDarkMode;
  final TextEditingController controller;


  const CustomSearchBar({
    super.key,
    required this.isDarkMode,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search for a country...',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 8),
          child: Icon(
            Icons.search,
            color: isDarkMode
                ? AppColors.darkInputFill
                : AppColors.lightInputFill,
          ),
        ),
      ),
      style: GoogleFonts.nunitoSans(
        fontSize: textSize1,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? AppColors.darkText : AppColors.lightText,
      ),
      onChanged: (value) {
        homeController.search(value);
      },
    );
  }
}
