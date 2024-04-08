import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';


class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  String searchText = '';
  String name = 'All';
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
              child: Image.asset(
                AppImages.library,
                height: 30.h,
                width: 30.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            "My Library",
            style: AppTextStyle.interBold
                .copyWith(color: AppColors.black, fontSize: 24.sp),
          ),
          actions: [
            IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.add,
                color: AppColors.c06070D,
                size: 24.w,
              ),
            ),
          ],
        ),
        body: const Column(children: [
          Text("Cards")
        ],)
      ),
    );
  }
}

