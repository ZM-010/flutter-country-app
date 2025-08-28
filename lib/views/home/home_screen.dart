import 'package:arz8_task/controllers/home_controller.dart';
import 'package:arz8_task/controllers/theme_controller.dart';
import 'package:arz8_task/routes/app_routes.dart';
import 'package:arz8_task/utils/app_colors.dart';
import 'package:arz8_task/utils/dimens.dart';
import 'package:arz8_task/views/home/widgets/country_card.dart';
import 'package:arz8_task/views/home/widgets/custom_app_bar.dart';
import 'package:arz8_task/views/home/widgets/custom_dropdown.dart';
import 'package:arz8_task/views/home/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends GetView<HomeController> {
  final ThemeController themeController = Get.find<ThemeController>();
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Obx(() {
      final isDarkMode = themeController.themeMode.value == ThemeMode.dark;

      return Scaffold(
        appBar: CustomAppBar(
          isDarkMode: isDarkMode,
          onTap: () => themeController.toggleTheme(),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32.0,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSearchBar(isDarkMode: isDarkMode,
                      controller: _searchController,),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomDropdown(
                        value: controller.selectedRegion.value,
                        isDarkMode: isDarkMode,
                        onChanged: (value) {
                          if (value != null) {
                            controller.filterByRegion(value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 200.0),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (controller.filteredCountries.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 200.0),
                            child: Text(
                              'No countries found',
                              style: GoogleFonts.nunitoSans(
                                fontSize: textSize1,
                                fontWeight: FontWeight.w600,
                                color:
                                isDarkMode
                                    ? AppColors.darkText
                                    : AppColors.lightText,
                              ),
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.filteredCountries.length,
                        itemBuilder: (context, index) {
                          final country = controller.filteredCountries[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22.0),
                            child: CountryCard(
                              country: country,
                              isDarkMode: isDarkMode,
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.detail,
                                  arguments: country,
                                );
                              },
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
