import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practidse/blocs/books/cards_state.dart';
import 'package:practidse/data/repositories/books_repository.dart';
import '../../data/api_provider/api_provider.dart';
import '../../data/models/card/card_model.dart';
import 'cards_event.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc({required this.booksRepository, this.bookModel})
      : super(CardsInitialState()) {
    on<GetCardsEvent>(_getBooks);
    on<AddCardEvent>(_addBooks);
    on<DeleteCardEvent>(_deleteBooks);
    on<UpdateCardEvent>(_updateBooks);
  }

  CardModel? bookModel;
  final CardsRepository booksRepository;
}

Future<void> _getBooks(
  GetCardsEvent event,
  Emitter<CardsState> emit,
) async {
  emit(CardsLoadingState());
  await Future.delayed(const Duration(seconds: 1));
  ApiProvider apiProvider = ApiProvider();
  CardsRepository booksRepository = CardsRepository(apiProvider: apiProvider,);
  var response = await booksRepository.getCards();
  if (response.errorText.isNotEmpty) {
    emit(CardsErrorState(response.errorText));
  } else {
    emit(CardsSuccessState(cards: response.data as List<CardModel>));
  }
}

Future<void> _addBooks(
  AddCardEvent event,
  Emitter<CardsState> emit,
) async {
  emit(CardsLoadingState());

  try {
    ApiProvider apiProvider = ApiProvider();
    CardsRepository booksRepository = CardsRepository(apiProvider: apiProvider);
    var response1= await booksRepository.addNewCard(event.cardModel);
    if (response1.errorText.isNotEmpty) {
      emit(CardsErrorState(response1.errorText));
    }
  } catch (error) {
    emit(CardsErrorState(error.toString()));
  }
}

Future<void> _updateBooks(
  UpdateCardEvent event,
  Emitter<CardsState> emit,
) async {
  emit(CardsLoadingState());
  try {
    ApiProvider apiProvider = ApiProvider();
    CardsRepository booksRepository = CardsRepository(apiProvider: apiProvider);
    var response1 = await booksRepository.updateCard(event.cardModel);
    if (response1.errorText.isNotEmpty) {
      emit(CardsErrorState(response1.errorText));
    }
    else{
      var response2=await booksRepository.getCards();
      emit(CardsSuccessState(cards: response2.data as List<CardModel>));
    }
  } catch (error) {
    emit(CardsErrorState(error.toString()));
  }
  // add(GetCardsEvent());
}

Future<void> _deleteBooks(
  DeleteCardEvent event,
  Emitter<CardsState> emit,
) async {
  try {
    ApiProvider apiProvider = ApiProvider();
    CardsRepository booksRepository = CardsRepository(apiProvider: apiProvider);
    var response = await booksRepository.deleteCard(event.uuid);

    if (response.errorText.isNotEmpty) {
      emit(CardsErrorState(response.errorText));
    }
  } catch (error) {
    emit(CardsErrorState(error.toString()));
  }
}
