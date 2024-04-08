import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practidse/screens/transfer/widget/card_widget.dart';
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
        body: Column(
          children: [
            SizedBox(
              height: 240.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CardWidget(
                    balance: 10000,
                    cardNumber: "5282 3456 7890 1289",
                    color: '',
                    bank: 'HamkorBank',
                    expiredDate: '10/24',
                  ),
                  CardWidget(
                    balance: 10000,
                    cardNumber: "5282 3456 7890 1289",
                    color: '',
                    bank: 'HamkorBank',
                    expiredDate: '10/24',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
