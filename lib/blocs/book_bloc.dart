// import 'package:bloc/bloc.dart';
//
// import '../data/models/books_model.dart';
// import '../data/repositories/book_repo.dart';
// import 'book_event.dart';
// import 'book_state.dart';
//
//
// class BookBloc extends Bloc<BookEvent, BookState> {
//   BookBloc({required this.apiRepository}) : super(BookInitialState()) {
//     on<GetBookEvent>((event, emit) async {
//       emit(BookLoadingState());
//       List<BooksModel> list = await apiRepository.getAllBooks();
//       if (list.isEmpty) {
//         emit(BookErrorState(errorText: "Something went wrong"));
//       } else {
//         emit(BookSuccessState(books: list));
//       }
//     });
//     on<InsertBookEvent>((event, emit) async {
//       emit(BookLoadingState());
//       await apiRepository.insertBook(event.bookModels);
//       List<BooksModel> list = await apiRepository.getAllBooks();
//       emit(BookSuccessState(books: list));
//     });
//
//     on<DeleteBookEvent>((event, emit) async {
//       emit(BookLoadingState());
//       await apiRepository.deleteBook(event.uuid);
//       List<BooksModel> list = await apiRepository.getAllBooks();
//       emit(BookSuccessState(books: list));
//     });
//
//     on<UpdateBookEvent>((event, emit) async {
//       emit(BookLoadingState());
//       await apiRepository.updateBook(event.bookModels);
//       List<BooksModel> list = await apiRepository.getAllBooks();
//       emit(BookSuccessState(books: list));
//     });
//   }
//
//   final ApiRepository apiRepository;
// }
