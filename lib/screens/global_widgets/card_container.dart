import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practidse/utils/images/app_images.dart';
import 'package:practidse/utils/styles/app_text_style.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.cardType,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expireDate,
    required this.colors,
  });

  final String cardType;
  final String cardNumber;
  final String cardHolderName;
  final String expireDate;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16.r,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.cipPng,
                  width: 40.w,
                  height: 30.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  cardType,
                  style: AppTextStyle.interBold.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 23.sp,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              cardNumber,
              style: AppTextStyle.interBold.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CARD HOLDER NAME",
                      style: AppTextStyle.interBold.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      cardHolderName,
                      style: AppTextStyle.interBold.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EXPIRE DATA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      expireDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
