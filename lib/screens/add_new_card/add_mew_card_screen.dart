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
              flex: 6,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
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
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    gradientColors.length,
                    (index) => ZoomTapAnimation(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        height: 50.w,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: gradientColors[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Ink(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    16.r,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

List<List<Color>> gradientColors = [
  [
    const Color(0xFF23F2E6),
    const Color(0xFF2ACB4E),
    const Color(0xFFC529FC),
  ],
  [
    const Color(0xFFFFD951),
    const Color(0xFFEC201B),
  ],
  [
    const Color(0xFF006BFF),
    const Color(0xFF343AD7),
    const Color(0xFFF43DF7),
  ],
  [
    const Color(0xFF4EDFFF),
    const Color(0xFFFFD90F),
    const Color(0xFF930BFD),
  ],
  [
    const Color(0xFF0038FF),
    const Color(0xFF00E0FF),
    const Color(0xFF1FAEFF),
  ],
  [
    const Color(0xFF0A7CCF),
    const Color(0xFF22FF53),
    const Color(0xFF22FF95),
  ],
  [
    const Color(0xFF4D20FF),
    const Color(0xFFE46289),
    const Color(0xFFFF5789),
  ],
  [
    const Color(0xFF00FFC2),
    const Color(0xFF1CF2CC),
    const Color(0xFF2F9FF1),
  ],
  [
    const Color(0xFF001973),
    const Color(0xFF00AAB8),
    const Color(0xFF00E0FF),
    const Color(0xFF423FC3),
  ],
  [
    const Color(0xFFFF29A8),
    const Color(0xFFFF7A00),
    const Color(0xFFFFD481),
  ],
  [
    const Color(0xFFFFDCC5),
    const Color(0xFFB515D0),
    const Color(0xFFB515D0).withOpacity(
      0.8,
    ),
  ],
  [
    const Color(0xFF4EDFFF),
    const Color(0xFF6A24FE),
    const Color(0xFF929CF3),
  ],
  [
    const Color(0xFF3F00B9),
    const Color(0xFFE507B6),
    const Color(0xFFFF8993),
  ],
  [
    const Color(0xFF00EAFF),
    const Color(0xFF4E29E4),
    const Color(0xFF6A40D3),
    const Color(0xFF9AAAFF),
  ],
  [
    const Color(0xFF0466EE),
    const Color(0xFF35DDA1),
    const Color(0xFF46B835),
  ],
  [
    const Color(0xFF0032EF),
    const Color(0xFF1AC7FF),
    const Color(0xFF339DFF),
    const Color(0xFFFF16F0),
  ],
  [
    const Color(0xFF9020FF),
    const Color(0xFFEB20B2),
    const Color(0xFFFF8B20),
  ],
  [
    const Color(0xFF20E4FF),
    const Color(0xFF4D20FF),
    const Color(0xFFFFD90F),
  ],
  [
    const Color(0xFF00A3FF),
    const Color(0xFFFFBE40),
    const Color(0xFFFFF065),
  ],
  [
    const Color(0xFFFF22F6),
    const Color(0xFFFF9900),
    const Color(0xFF00A3FF),
  ],
];

List<String> cardTypes = [
  "UZCARD",
  "HUMO",
  "VISA",
  "MASTERCARD",
  "UNION PAY",
];
