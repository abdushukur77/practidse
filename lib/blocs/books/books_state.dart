
import 'package:practidse/data/models/book/book_model.dart';

abstract class BooksState {}

class BooksSuccessState extends BooksState {
  final List<BookModel> books;

  BooksSuccessState({required this.books});
}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class AddBookState extends BooksState {
  final BookModel bookModel;

  AddBookState(this.bookModel);
}
class UpdateBookState extends BooksState {
  final BookModel bookModel;

  UpdateBookState(this.bookModel);
}

class BooksErrorState extends BooksState {
  final String errorText;

  BooksErrorState(this.errorText);
}
