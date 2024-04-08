import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practidse/blocs/books/cards_bloc.dart';
import 'package:practidse/blocs/books/cards_event.dart';
import 'package:practidse/blocs/books/cards_state.dart';
import 'package:practidse/data/models/card/card_model.dart';
import 'package:practidse/screens/global_widgets/card_container.dart';
import 'package:practidse/utils/colors/app_colors.dart';
import 'package:practidse/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'CARDS',
            style: AppTextStyle.interBold.copyWith(color: AppColors.white),
          ),
          centerTitle: true,
          actions: [
            ZoomTapAnimation(
              onTap: () {},
              child: Icon(
                Icons.add,
                size: 20.w,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: BlocConsumer<CardsBloc, CardsState>(
          builder: (context, state) {
            if (state is CardsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CardsErrorState) {
              return Center(
                child: Text(state.errorText),
              );
            }

            if (state is CardsSuccessState) {
              return RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(
                      seconds: 2,
                    ),
                    () {
                      context.read<CardsBloc>().add(
                            GetCardsEvent(),
                          );
                    },
                  );
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ...List.generate(state.cards.length, (index) {
                            CardModel card = state.cards[index];
                            return CardContainer(
                              cardType: card.providerName,
                              cardNumber: card.cardNumber,
                              cardHolderName: card.ownerName,
                              expireDate: card.expireDate,
                              colors: [
                                Color(
                                  int.parse(
                                    card.color[0],
                                  ),
                                ),
                                Color(
                                  int.parse(
                                    card.color[1],
                                  ),
                                ),
                              ],
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: Text(
                "INITIAL STATE",
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
