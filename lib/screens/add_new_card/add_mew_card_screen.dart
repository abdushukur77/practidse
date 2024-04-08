import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practidse/utils/colors/app_colors.dart';
import 'package:practidse/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextInputType holderNameInputType = TextInputType.text;
  final TextInputType cardNumberInputType = TextInputType.number;
  final TextInputType amountInputType = TextInputType.number;
  final TextInputType expireDateInputType = TextInputType.datetime;

  List<TextInputType> inputTypes = [];
  final List<String> titles = [
    "HOLDER NAME",
    "CARD NUMBER",
    "AMOUNT",
    "EXPIRE DATE",
  ];
  List<String> values = [
    "",
    "",
    "",
    "",
  ];

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    inputTypes = [
      holderNameInputType,
      cardNumberInputType,
      amountInputType,
      expireDateInputType,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.w,
              ),
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: 20.w,
                ),
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            'ADD NEW CARD',
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      inputTypes.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                            border: Border.all(
                              color: AppColors.white,
                              width: 3.w,
                            ),
                          ),
                          child: TextField(
                            onChanged: (v) {
                              values[index] = v;
                              setState(() {});
                            },
                            onSubmitted: (v) {
                              values[index] = v;
                              setState(() {});
                            },
                            style: AppTextStyle.interBold.copyWith(
                              color: AppColors.white,
                            ),
                            keyboardType: inputTypes[index],
                            textInputAction: index == 3
                                ? TextInputAction.done
                                : TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  16.r,
                                ),
                              ),
                              hintText: titles[index],
                              hintStyle: AppTextStyle.interBold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                "ILTIMOS, KARTA TURINI TANLANG:",
                style: AppTextStyle.interBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(
                    cardTypes.length,
                    (index) => ZoomTapAnimation(
                      child: Container(
                        height: 40.h,
                        width: 200.w,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            cardTypes[index],
                            style: AppTextStyle.interBold.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "ILTIMOS, KARTA RANGINI TANGLANG:",
                style: AppTextStyle.interBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> cardTypes = [
  "UZCARD",
  "HUMO",
  "VISA",
  "MASTERCARD",
  "UNION PAY",
];
