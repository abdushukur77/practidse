
import 'package:practidse/data/models/book/book_model.dart';

import '../api_provider/api_provider.dart';
import '../response/my_response.dart';

class BooksRepository {
  BooksRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<MyResponse> getBooks() => apiProvider.getBooks();
  Future<MyResponse> addNewBooks(BookModel bookModel) => apiProvider.addNewBook(bookModel);
  Future<MyResponse> updateNewBooks(BookModel bookModel) => apiProvider.updateBook(bookModel);
  Future<MyResponse> deleteBooks(String uuid) => apiProvider.deleteBook(uuid);
}
