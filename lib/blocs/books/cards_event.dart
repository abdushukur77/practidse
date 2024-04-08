import 'package:practidse/data/models/card/card_model.dart';

abstract class CardsEvent {}

class GetCardsEvent extends CardsEvent {}

class AddCardEvent extends CardsEvent {
  final CardModel cardModel;

  AddCardEvent({required this.cardModel});
}

class UpdateCardEvent extends CardsEvent {
  final CardModel cardModel;

  UpdateCardEvent({required this.cardModel});
}

class DeleteCardEvent extends CardsEvent {
  final String uuid;

  DeleteCardEvent({
    required this.uuid,
  });
}
