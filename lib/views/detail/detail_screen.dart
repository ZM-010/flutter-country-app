import 'package:arz8_task/controllers/detail_controller.dart';
import 'package:arz8_task/controllers/theme_controller.dart';
import 'package:arz8_task/utils/app_colors.dart';
import 'package:arz8_task/utils/dimens.dart';
import 'package:arz8_task/views/home/widgets/custom_app_bar.dart';
import 'package:arz8_task/views/shared/widgets/build_flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailScreen extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    final formatter = NumberFormat.decimalPattern();

    return Obx(() {
      final isDarkMode = themeController.themeMode.value == ThemeMode.dark;
      final country = controller.country;

      return Scaffold(
        appBar: CustomAppBar(
          isDarkMode: isDarkMode,
          onTap: () => themeController.toggleTheme(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ElevatedButton.icon(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                  ),
                  label: Text(
                    'Back',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode
                        ? AppColors.darkPrimary
                        : AppColors.lightPrimary,
                    foregroundColor:
                    isDarkMode ? AppColors.darkText : AppColors.lightText,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 26,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                Hero(
                  tag: country.name,
                  child: ClipRRect(
                    child: BuildFlag( pngUrl: country.flags!.png, svgUrl: country.flags!.svg,)
                  ),
                ),

                const SizedBox(height: 40),

                Text(
                  country.name.common,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: isDarkMode
                        ? AppColors.darkText
                        : AppColors.lightText,
                  ),
                ),

                const SizedBox(height: 20),

                _infoRow(
                    context, 'Native Name', country.name?.official ?? '-', isDarkMode),
                _infoRow(
                    context,
                    'Population',
                    formatter.format(country.population ?? 0),
                    isDarkMode),
                _infoRow(context, 'Region', country.region ?? '-', isDarkMode),
                _infoRow(context, 'Sub Region', country.subregion ?? '-', isDarkMode),
                _infoRow(
                  context,
                  'Capital',
                  (country.capital != null && country.capital!.isNotEmpty)
                      ? country.capital!.first
                      : '-',
                  isDarkMode,
                ),

                const SizedBox(height: 40),

                _infoRow(context, 'Top Level Domain',
                    country.tld?.join(", ") ?? '-', isDarkMode),
                _infoRow(
                  context,
                  'Currencies',
                  country.currencies != null
                      ? country.currencies!.values
                      .map((c) => c.name)
                      .join(", ")
                      : '-',
                  isDarkMode,
                ),
                _infoRow(
                  context,
                  'Languages',
                  country.languages != null
                      ? country.languages!.values.join(", ")
                      : '-',
                  isDarkMode,
                ),

                const SizedBox(height: 40),

                Text(
                  'Border Countries:',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: isDarkMode
                        ? AppColors.darkText
                        : AppColors.lightText,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: (country.borders != null && country.borders!.isNotEmpty)
                      ? country.borders!.map((border) {
                    return Material(
                      elevation: 1,
                      color: isDarkMode
                          ? AppColors.darkPrimary
                          : AppColors.lightPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                        side: BorderSide.none,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Text(
                          border,
                          style: TextStyle(
                            color: isDarkMode
                                ? AppColors.darkText
                                : AppColors.lightText,
                          ),
                        ),
                      ),
                    );
                  }).toList()
                      : [const Text('-')],
                ),

              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _infoRow(
      BuildContext context,
      String label,
      String value,
      bool isDarkMode,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text.rich(
        TextSpan(
          text: '$label: ',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: textSize1,
            fontWeight: FontWeight.w800,
            color: isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
          children: [
            TextSpan(
              text: value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: textSize1,
                fontWeight: FontWeight.w300,
                color: isDarkMode ? AppColors.darkText : AppColors.lightText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

