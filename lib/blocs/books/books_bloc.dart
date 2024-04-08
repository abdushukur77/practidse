import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practidse/blocs/books/books_state.dart';
import 'package:practidse/data/models/book/book_model.dart';
import 'package:practidse/data/repositories/books_repository.dart';
import '../../data/api_provider/api_provider.dart';
import 'books_event.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.booksRepository, this.bookModel})
      : super(BooksInitialState()) {
    on<GetBooksEvent>(_getBooks);
    on<AddBookEvent>(_addBooks);
    on<DeleteBookEvent>(_deleteBooks);
    on<UpdateBookEvent>(_updateBooks);
  }

  BookModel? bookModel;
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
  var response = await booksRepository.getBooks();
  if (response.errorText.isNotEmpty) {
    emit(BooksErrorState(response.errorText));
  } else {
    emit(BooksSuccessState(books: response.data as List<BookModel>));
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
    var response = await booksRepository.addNewBooks(event.bookModel);

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
    var response = await booksRepository.updateNewBooks(event.bookModel);

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
    var response = await booksRepository.deleteBooks(event.uuid);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}
