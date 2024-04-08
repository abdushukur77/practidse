import 'package:practidse/data/models/card/card_model.dart';

abstract class CardsState {}

class CardsSuccessState extends CardsState {
  final List<CardModel> cards;

  CardsSuccessState({required this.cards});
}

class CardsInitialState extends CardsState {}

class CardsLoadingState extends CardsState {}

class AddCardState extends CardsState {
  final CardModel cardModel;

  AddCardState(this.cardModel);
}
class UpdateCardState extends CardsState {
  final CardModel cardModel;

  UpdateCardState(this.cardModel);
}

class CardsErrorState extends CardsState {
  final String errorText;

  CardsErrorState(this.errorText);
}
