import 'package:practidse/data/models/card/card_model.dart';

abstract class BooksState {}

class BooksSuccessState extends BooksState {
  final List<CardModel> books;

  BooksSuccessState({required this.books});
}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class AddBookState extends BooksState {
  final CardModel bookModel;

  AddBookState(this.bookModel);
}
class UpdateBookState extends BooksState {
  final CardModel bookModel;

  UpdateBookState(this.bookModel);
}

class BooksErrorState extends BooksState {
  final String errorText;

  BooksErrorState(this.errorText);
}
