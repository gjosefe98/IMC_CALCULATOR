import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Scaffold(
      backgroundColor: AppColors.Background,
      appBar: toolbarResult(),
      body: bodyResult(imcResult, context),
    );
  }

  Padding bodyResult(imcResult, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tu resultado", style: TextStyles.highLightedText),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.BackgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getStatusByImc(imcResult),
                      style: TextStyle(
                        fontSize: 50,
                        color: getColorByImc(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyles.highLightedText,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getDescriptionByImc(imcResult),
                        style: TextStyles.bodyText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Finalizar", style: TextStyles.bodyText),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue,
      < 24.9 => Colors.green,
      < 29.99 => Colors.orange,
      _ => Colors.red,
    };
  }

  getStatusByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Imc Bajo",
      < 24.9 => "Imc Normal",
      < 29.99 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  getDescriptionByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Tu peso está por debajo de lo recomendado.",
      < 24.9 => "Tu peso está en el rango saludable.",
      < 29.99 => "Tienes sobrepeso, cuida tu alimentacion.",
      _ => "Tienes obesidad, consulta con un especialista.",
    };
  }
}
