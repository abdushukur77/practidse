import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/styles/app_text_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.balance,
    required this.cardNumber,
    required this.expiredDate,
    required this.bank,
    required this.color,
  });

  final num balance;
  final String cardNumber;
  final String expiredDate;
  final String bank;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.w),
      margin: EdgeInsets.all(10.w),
      width: 330.w,
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          40.r,
        ),
        gradient: const LinearGradient(
          colors: [
            Colors.purple,
            Colors.pink,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Current Balance",
                style: AppTextStyle.interLight
                    .copyWith(color: Colors.white, fontSize: 16.sp),
              ),
              Text(
                bank,
                style: AppTextStyle.interLight.copyWith(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "\$$balance",
            style: AppTextStyle.interBold
                .copyWith(color: Colors.white, fontSize: 30.sp),
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardNumber,
                style: AppTextStyle.interBold.copyWith(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 30.w),
              Text(
                expiredDate,
                style: AppTextStyle.interBold
                    .copyWith(color: Colors.white, fontSize: 12.sp),
              ),
            ],
          ),

          // Your children widgets here
        ],
      ),
    );
  }
}
