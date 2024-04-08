import 'package:practidse/data/models/card/card_model.dart';

abstract class BooksEvent {}

class GetBooksEvent extends BooksEvent {}

class AddBookEvent extends BooksEvent {
  final CardModel bookModel;

  AddBookEvent({required this.bookModel});
}
class UpdateBookEvent extends BooksEvent {
  final CardModel bookModel;

  UpdateBookEvent({required this.bookModel});
}

class DeleteBookEvent extends BooksEvent {
  final String uuid;

  DeleteBookEvent({
    required this.uuid,
  });
}
