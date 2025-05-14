import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChange;

  const HeightSelector({super.key, required this.selectedHeight, required this.onHeightChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.BackgroundComponent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Text("Altura", style: TextStyles.bodyText),
              Text(
                "${widget.selectedHeight.toStringAsFixed(0)} cm",
                style: TextStyles.highLightedText,
              ),
              Slider(
                value: widget.selectedHeight,
                onChanged: (newHeight) {
                  widget.onHeightChange(newHeight);
                },
                min: 100,
                max: 300,
                divisions: 200,
                activeColor: AppColors.primary,
                label: "${widget.selectedHeight.toStringAsFixed(0)}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
