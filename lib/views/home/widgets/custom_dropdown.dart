import 'package:arz8_task/data/models/enums/region.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arz8_task/utils/app_colors.dart';
import 'package:arz8_task/utils/dimens.dart';

class CustomDropdown extends StatelessWidget {
  final Region? value;
  final bool isDarkMode;
  final ValueChanged<Region?> onChanged;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Region>(

        hint: Text(
          'Filter by Region',
          style: GoogleFonts.nunitoSans(
            fontSize: textSize1,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
        ),
        value: value == Region.Unknown ? null : value,
        items: Region.values
            .where((r) => r != Region.Unknown)
            .map((region) => DropdownMenuItem<Region>(
          value: region,
          child: Text(
            region.toString().split('.').last,
            style: GoogleFonts.nunitoSans(
              fontSize: textSize1,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 60,
          width: 220,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
          iconSize: 24,
          iconEnabledColor: isDarkMode ? AppColors.darkText : AppColors.lightText,
          iconDisabledColor: Colors.grey,
          openMenuIcon: Icon(
            Icons.keyboard_arrow_up_rounded,
            color: isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 250,
          offset: const Offset(0, -5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
