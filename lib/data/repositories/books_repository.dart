import 'package:practidse/data/models/card/card_model.dart';

import '../api_provider/api_provider.dart';
import '../response/my_response.dart';

class CardsRepository {
  CardsRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<MyResponse> getCards() => apiProvider.getCards();

  Future<MyResponse> addNewCard(CardModel bookModel) =>
      apiProvider.addNewCard(bookModel);

  Future<MyResponse> updateCard(CardModel bookModel) =>
      apiProvider.updateCard(bookModel);

  Future<MyResponse> deleteCard(String uuid) => apiProvider.deleteCard(uuid);
}
