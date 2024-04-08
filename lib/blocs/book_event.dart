
import '../data/models/books_model.dart';

abstract class BookEvent {}

class GetBookEvent extends BookEvent {}

class InsertBookEvent extends BookEvent {
  InsertBookEvent({required this.bookModels});

  final BooksModel bookModels;
}

class DeleteBookEvent extends BookEvent {
  DeleteBookEvent({required this.uuid});

  final String uuid;
}

class UpdateBookEvent extends BookEvent {
  UpdateBookEvent({required this.bookModels});

  final BooksModel bookModels;
}
