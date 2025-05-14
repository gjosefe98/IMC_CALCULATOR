import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender = null;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hombre
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Hombre";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                right: 8,
                left: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selectedGender == "Hombre"
                          ? AppColors.BackgroundCoomponentSelected
                          : AppColors.BackgroundComponent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100),
                      SizedBox(height: 8),
                      Text("Hombre", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //Mujer
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Mujer";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                right: 16,
                left: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selectedGender == "Mujer"
                          ? AppColors.BackgroundCoomponentSelected
                          : AppColors.BackgroundComponent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/images/female.png", height: 100),
                      SizedBox(height: 8),
                      Text("Mujer", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
