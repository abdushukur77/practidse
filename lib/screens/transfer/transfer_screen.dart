import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practidse/utils/colors/app_colors.dart';
import 'package:practidse/utils/styles/app_text_style.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c2A3256,
        appBar: AppBar(
          backgroundColor: AppColors.c2A3256,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'TRANSFER',
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
