import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practidse/blocs/books/cards_bloc.dart';
import 'package:practidse/blocs/books/cards_event.dart';
import 'package:practidse/data/models/card/card_model.dart';
import 'package:practidse/notifications/locale_notifications.dart';
import 'package:practidse/utils/colors/app_colors.dart';
import 'package:practidse/utils/images/app_images.dart';
import 'package:practidse/utils/styles/app_text_style.dart';
import 'package:practidse/utils/utility_functions/utility_functions.dart';
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

  var formKey = GlobalKey<FormState>();
  int activeTypeIndex = -1;
  int activeColorIndex = -1;

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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                        inputTypes.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                          ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (v) {
                              values[index] = v;
                              setState(() {});
                            },
                            validator: (String? v) {
                              if (index == 0) {
                                if (v == null || v.length < 10) {
                                  return "ILTIMOS, ISM FAMILYANGIZNI TO'LIQ KIRITING!!!";
                                }
                              }
                              if (index == 1) {
                                if (v == null ||
                                    v.length < 16 ||
                                    v.length > 16) {
                                  return 'KARTA RAQAMI 16 XONALIK BOLISHI KERAK!!!';
                                }
                              }
                              if (index == 2) {
                                if (v!.isEmpty) {
                                  return "ILTIMOS, KAMIDA 1000 UZS KIRITING!!!";
                                } else {
                                  if (int.parse(v) < 1000) {
                                    return "BALANSINGIZDA KAMIDA 1000 UZS BO'LISHI KERAK!!!";
                                  }
                                }
                              }
                              if (index == 3) {
                                // if(){}
                              }
                              return null;
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
                    ],
                  ),
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
                        onTap: () {
                          activeTypeIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          height: 40.h,
                          width: 200.w,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            color: activeTypeIndex == index
                                ? Colors.redAccent
                                : Colors.teal,
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              cardTypes[index],
                              style: AppTextStyle.interBold.copyWith(
                                color: activeTypeIndex == index
                                    ? AppColors.white
                                    : AppColors.black,
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
                      onTap: () {
                        activeColorIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        height: activeColorIndex == index ? 70.w : 50.w,
                        width: activeColorIndex == index ? 70.w : 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: gradientColors[index],
                          ),
                        ),
                        child: Center(
                          child: activeColorIndex == index
                              ? Container(
                                  height: 35.w,
                                  width: 35.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.black,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppImages.tick,
                                      width: 30.w,
                                      height: 30.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
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
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(
                    16.r,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    16.r,
                  ),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      CardModel cardModel = CardModel(
                        color: [
                          "0xFF23F2E6",
                          "0xFF2ACB4E",
                          "0xFFC529FC",
                        ],
                        amount: double.parse(values[2]),
                        cardNumber: values[1],
                        expireDate: values[3],
                        bankName: "MILLIY BANK",
                        cardName: "HOME",
                        isMain: false,
                        ownerName: values[0],
                        uuid: '',
                        providerName: "UZCARD",
                      );
                      context.read<CardsBloc>().add(
                            AddCardEvent(
                              cardModel: cardModel,
                            ),
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.lightBlueAccent,
                          content: Text(
                            'CARD ADDED SUCCESSFULLY',
                            style: AppTextStyle.interBold,
                          ),
                        ),
                      );
                      LocalNotificationService().showNotification(
                        title: 'MUVAFFAQIYATLI!!!',
                        body:
                            "${values[1]} RAQAMLI KARTA MUVAFFAQIYATLI QO'SHILDI!!!",
                        id: DateTime.now().millisecond,
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "ILTIMOS, BARCHA MA'LUMOTLARNI TO'G'RI KIRITING!!!",
                            style: AppTextStyle.interBold,
                          ),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      'ADD NEW CARD',
                      style: AppTextStyle.interBold,
                    ),
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

List<String> cardTypes = [
  "UZCARD",
  "HUMO",
  "VISA",
  "MASTERCARD",
  "UNION PAY",
];
