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
import 'package:practidse/screens/add_new_card/add_new_card_screen.dart';
import 'package:practidse/screens/global_widgets/card_container.dart';
import 'package:practidse/utils/colors/app_colors.dart';
import 'package:practidse/utils/styles/app_text_style.dart';
import 'package:practidse/utils/utility_functions/utility_functions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewCardScreen(
                      voidCallback: () {
                        context.read<CardsBloc>().add(
                              GetCardsEvent(),
                            );
                      },
                    ),
                  ),
                );
              },
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
            } else if (state is CardsErrorState) {
              return Center(
                child: Text(state.errorText),
              );
            } else if (state is CardsSuccessState) {
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
                          // horizontal: 10.w,
                        ),
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ...List.generate(
                            state.cards.length,
                            (index) {
                              CardModel card = state.cards[index];
                              return CardContainer(
                                cardType: card.providerName,
                                cardNumber: card.cardNumber,
                                cardHolderName: card.ownerName,
                                expireDate: card.expireDate,
                                colors: makeColor(
                                  card.color,
                                ),
                                amount: NumberFormat.currency(
                                  locale: "uz",
                                ).format(
                                  card.amount,
                                ),
                                voidCallback: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: AppColors.black,
                                        title:
                                            const Text("Ishonchingiz komilmi?"),
                                        titleTextStyle:
                                            AppTextStyle.interBold.copyWith(
                                          color: AppColors.white,
                                          fontSize: 20.sp,
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              context.read<CardsBloc>().add(
                                                    DeleteCardEvent(
                                                      uuid: card.uuid,
                                                    ),
                                                  );
                                              LocalNotificationService()
                                                  .showNotification(
                                                title: 'DIQQAT!!!',
                                                body:
                                                    "${card.cardNumber} RAQAMLI KARTA O'CHIRILDI!!!",
                                                id: DateTime.now().millisecond,
                                              );
                                              Navigator.pop(context);
                                              context.read<CardsBloc>().add(
                                                    GetCardsEvent(),
                                                  );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  duration: const Duration(
                                                    seconds: 2,
                                                  ),
                                                  backgroundColor:
                                                      Colors.lightBlueAccent,
                                                  content: Text(
                                                    textAlign: TextAlign.center,
                                                    'CARD DELETED SUCCESSFULLY!!!',
                                                    style: AppTextStyle
                                                        .interBold
                                                        .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Yes',
                                              style: AppTextStyle.interBold
                                                  .copyWith(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'No',
                                              style: AppTextStyle.interBold
                                                  .copyWith(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
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
