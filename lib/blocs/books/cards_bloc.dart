import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practidse/blocs/books/cards_state.dart';
import 'package:practidse/data/repositories/books_repository.dart';
import '../../data/api_provider/api_provider.dart';
import '../../data/models/card/card_model.dart';
import 'cards_event.dart';

class CardsBloc extends Bloc<CardsEvent, BooksState> {
  CardsBloc({required this.booksRepository, this.bookModel})
      : super(BooksInitialState()) {
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
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());
  await Future.delayed(const Duration(seconds: 1));
  ApiProvider apiProvider = ApiProvider();
  CardsRepository booksRepository = CardsRepository(
    apiProvider: apiProvider,
  );
  var response = await booksRepository.getCards();
  if (response.errorText.isNotEmpty) {
    emit(BooksErrorState(response.errorText));
  } else {
    emit(BooksSuccessState(books: response.data as List<CardModel>));
  }
}

Future<void> _addBooks(
  AddCardEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());

  try {
    ApiProvider apiProvider = ApiProvider();
    CardsRepository booksRepository = CardsRepository(apiProvider: apiProvider);
    var response = await booksRepository.addNewCard(event.cardModel);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}

Future<void> _updateBooks(
  UpdateCardEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());

  try {
    ApiProvider apiProvider = ApiProvider();
    CardsRepository booksRepository = CardsRepository(apiProvider: apiProvider);
    var response = await booksRepository.updateCard(event.cardModel);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}

Future<void> _deleteBooks(
  DeleteCardEvent event,
  Emitter<BooksState> emit,
) async {
  try {
    ApiProvider apiProvider = ApiProvider();
    CardsRepository booksRepository = CardsRepository(apiProvider: apiProvider);
    var response = await booksRepository.deleteCard(event.uuid);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}
