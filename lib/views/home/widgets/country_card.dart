import 'package:arz8_task/models/country_model.dart';
import 'package:arz8_task/utils/app_colors.dart';
import 'package:arz8_task/views/shared/widgets/build_flag.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryCard extends StatelessWidget {
  final CountryModel country;
  final bool isDarkMode;
  final VoidCallback onTap;

  const CountryCard({
    super.key,
    required this.country,
    required this.isDarkMode,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern();

    return GestureDetector(
      onTap: onTap ,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: country.name?.common ?? country.name.toString(),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: BuildFlag(pngUrl: country.flags!.png, svgUrl: country.flags!.svg,)
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.name?.common ?? '-',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: isDarkMode
                            ? AppColors.darkText
                            : AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: 8),
      
                    Text.rich(
                      TextSpan(
                        text: 'Population: ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: formatter.format(country.population ?? 0),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
      
                    Text.rich(
                      TextSpan(
                        text: 'Region: ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: country.region ?? '-',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Capital: ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: (country.capital != null &&
                                country.capital!.isNotEmpty)
                                ? country.capital!.first
                                : '-',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
