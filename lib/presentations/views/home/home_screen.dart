import 'package:arz8_task/presentations/controllers/home_controller.dart';
import 'package:arz8_task/presentations/controllers/theme_controller.dart';
import 'package:arz8_task/presentations/views/home/widgets/country_card.dart';
import 'package:arz8_task/presentations/views/home/widgets/custom_app_bar.dart';
import 'package:arz8_task/presentations/views/home/widgets/custom_dropdown.dart';
import 'package:arz8_task/presentations/views/home/widgets/custom_search_bar.dart';
import 'package:arz8_task/routes/app_routes.dart';
import 'package:arz8_task/utils/app_colors.dart';
import 'package:arz8_task/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    final TextEditingController searchController = TextEditingController();

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
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32.0,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSearchBar(
                      isDarkMode: isDarkMode,
                      controller: searchController,
                    ),
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
                        return const Padding(
                          padding: EdgeInsets.only(top: 200.0),
                          child: Center(child: CircularProgressIndicator()),
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
                                color: isDarkMode
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
