import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practidse/blocs/books/books_state.dart';
import 'package:practidse/data/repositories/books_repository.dart';
import '../../data/api_provider/api_provider.dart';
import '../../data/models/card/card_model.dart';
import 'books_event.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.booksRepository, this.bookModel})
      : super(BooksInitialState()) {
    on<GetBooksEvent>(_getBooks);
    on<AddBookEvent>(_addBooks);
    on<DeleteBookEvent>(_deleteBooks);
    on<UpdateBookEvent>(_updateBooks);
  }

  CardModel? bookModel;
  final BooksRepository booksRepository;
}

Future<void> _getBooks(
  GetBooksEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());
  await Future.delayed(const Duration(seconds: 1));
  ApiProvider apiProvider = ApiProvider();
  BooksRepository booksRepository = BooksRepository(
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
  AddBookEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());

  try {
    ApiProvider apiProvider = ApiProvider();
    BooksRepository booksRepository = BooksRepository(apiProvider: apiProvider);
    var response = await booksRepository.addNewCard(event.bookModel);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}

Future<void> _updateBooks(
  UpdateBookEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());

  try {
    ApiProvider apiProvider = ApiProvider();
    BooksRepository booksRepository = BooksRepository(apiProvider: apiProvider);
    var response = await booksRepository.updateCard(event.bookModel);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}

Future<void> _deleteBooks(
  DeleteBookEvent event,
  Emitter<BooksState> emit,
) async {
  try {
    ApiProvider apiProvider = ApiProvider();
    BooksRepository booksRepository = BooksRepository(apiProvider: apiProvider);
    var response = await booksRepository.deleteCard(event.uuid);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}
