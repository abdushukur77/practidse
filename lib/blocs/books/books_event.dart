
import 'package:practidse/data/models/book/book_model.dart';

abstract class BooksEvent {}

class GetBooksEvent extends BooksEvent {}

class AddBookEvent extends BooksEvent {
  final BookModel bookModel;

  AddBookEvent({required this.bookModel});
}
class UpdateBookEvent extends BooksEvent {
  final BookModel bookModel;

  UpdateBookEvent({required this.bookModel});
}

class DeleteBookEvent extends BooksEvent {
  final String uuid;

  DeleteBookEvent({
    required this.uuid,
  });
}
