import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:practidse/blocs/books/cards_bloc.dart';
import 'package:practidse/blocs/books/cards_event.dart';
import 'package:practidse/blocs/books/cards_state.dart';
import 'package:practidse/data/models/card/card_model.dart';
import 'package:practidse/notifications/locale_notifications.dart';
import 'package:practidse/screens/tab_box/card/card_screen.dart';
import 'package:practidse/utils/colors/app_colors.dart';
import 'package:practidse/utils/styles/app_text_style.dart';
import 'package:practidse/utils/utility_functions/utility_functions.dart';
import '../../../utils/images/app_images.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int active1 = 0;
  int active2 = 1;
  TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'TRANSFER',
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        body: BlocConsumer<CardsBloc, CardsState>(
          builder: (context, state) {
            if (state is CardsSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Qaysi kartadan o'tkazmoqchisiz tanlang!!!",
                          style: AppTextStyle.interMedium.copyWith(
                              color: AppColors.white, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CarouselSlider(
                            items: List.generate(state.cards.length, (index) {
                              CardModel card = state.cards[index];
                              // active=index;
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 15.w, top: 15.h, right: 15.w),
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  border: Border.all(
                                    color: AppColors.white,
                                    width: 2.w,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: makeColor(card.color),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AppImages.cipPng,
                                          width:
                                              (active1 == index) ? 38.w : 10.sp,
                                          height:
                                              (active1 == index) ? 28.h : 5.sp,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Text(
                                          card.cardName,
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 23.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: (active1 == index) ? 10.h : 1.h,
                                    ),
                                    Text(
                                      card.cardNumber,
                                      style: AppTextStyle.interBold.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: (active1 == index) ? 15.h : 1.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'KARTA HISOBI:',
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: AppColors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                            locale: "uz",
                                          ).format(
                                            card.amount,
                                          ),
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: (active1 == index) ? 15.h : 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          card.ownerName,
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: (active1 == index)
                                                ? 16.sp
                                                : 10.sp,
                                          ),
                                        ),
                                        Text(
                                          card.expireDate,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: (active1 == index)
                                                ? 16.sp
                                                : 1.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                            options: CarouselOptions(
                              height: 185.h,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.81,
                              initialPage: active1,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              onPageChanged: (index, reason) {
                                active1 = index;
                                setState(() {});
                              },
                              scrollDirection: Axis.horizontal,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44.w),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        style: AppTextStyle.interRegular
                            .copyWith(color: AppColors.white, fontSize: 16.sp),
                        autovalidateMode: AutovalidateMode.always,
                        validator: (String? v) {
                          if (v!.isNotEmpty) {
                            if (int.parse(v) < 1000) {
                              return "Minimum 1000 som otkasish mumkin";
                            }
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 14.w),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red)),
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: AppColors.white)),
                          hintText: "Amount",
                          hintStyle: AppTextStyle.interMedium.copyWith(
                              color: AppColors.white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Qaysi kartga o'tkazmoqchisiz tanlang!!!",
                          style: AppTextStyle.interMedium.copyWith(
                              color: AppColors.white, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CarouselSlider(
                            items: List.generate(state.cards.length, (index) {
                              CardModel card = state.cards[index];
                              return Container(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  top: 15.h,
                                  right: 15.w,
                                ),
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    16.r,
                                  ),
                                  border: Border.all(
                                    color: AppColors.white,
                                    width: 2.w,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: makeColor(card.color),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AppImages.cipPng,
                                          width:
                                              (active2 == index) ? 38.w : 18.sp,
                                          height:
                                              (active2 == index) ? 28.h : 10.sp,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Text(
                                          card.cardName,
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 23.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      card.cardNumber,
                                      style: AppTextStyle.interBold.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: (active2 == index) ? 15.h : 1.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'KARTA HISOBI:',
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: AppColors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                            locale: "uz",
                                          ).format(
                                            card.amount,
                                          ),
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          card.ownerName,
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: (active2 == index)
                                                ? 16.sp
                                                : 10.sp,
                                          ),
                                        ),
                                        Text(
                                          card.expireDate,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: (active2 == index)
                                                ? 16.sp
                                                : 1.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                            options: CarouselOptions(
                              height: 185.h,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.81,
                              initialPage: active2,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              onPageChanged: (index, reason) {
                                active2 = index;
                                setState(() {});
                              },
                              scrollDirection: Axis.horizontal,
                            ))
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 44.w),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            if (active1 == active2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "YUBORUVCHI VA QABUL QILUVCHI KARTALAR HAR XIL BO'LISHI KERAK!!!",
                                    style: AppTextStyle.interMedium.copyWith(
                                        color: AppColors.white,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              );
                            }
                            if (amountController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "KAMIDA 1000 UZS O'TKAZMA AMALGA OSHIRISH MUMKIN!!!",
                                    style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              );
                            }
                            if(amountController.text.isNotEmpty){
                              if (state.cards[active1].amount <
                                  double.parse(amountController.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(
                                      seconds: 1,
                                    ),
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "Hisobda mablag' yetarli emas",
                                      style: AppTextStyle.interMedium.copyWith(
                                        color: AppColors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                CardModel card1 =
                                state.cards[active1];
                                CardModel card2 =
                                state.cards[active2];
                                card1.copyWith(
                                    amount: card1.amount -
                                        double.parse(
                                            amountController
                                                .text));
                                card2.copyWith(
                                    amount: card2.amount +
                                        double.parse(
                                            amountController
                                                .text));
                                CardModel firstCard = card1;
                                CardModel secondCard = card2;
                                context.read<CardsBloc>().add(
                                    UpdateCardEvent(
                                        cardModel: firstCard));
                                context.read<CardsBloc>().add(
                                    UpdateCardEvent(
                                        cardModel: secondCard));

                                LocalNotificationService()
                                    .showNotification(
                                  title:
                                  "DIQQAT!!! PUL O'TKAZMASI!!!",
                                  body:
                                  "${state.cards[active1].cardNumber} DAN ${state.cards[active2]} GA ${amountController.text} MIQDORIDA O'TKAZMA AMALGA OSHIRILDI!!!",
                                  id: DateTime.now().millisecond,
                                );
                                context.read<CardsBloc>().add(GetCardsEvent());
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const CardsScreen(),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            "O'tkazish",
                            style: AppTextStyle.interRegular.copyWith(
                                color: AppColors.white, fontSize: 16.sp),
                          )),
                    )
                  ],
                ),
              );
            }
            return const SizedBox();
          },
          listener: (BuildContext context, CardsState state) {},
        ),
      ),
    );
  }
}
