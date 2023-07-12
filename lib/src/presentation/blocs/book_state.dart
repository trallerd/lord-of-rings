part of 'book_bloc.dart';

abstract class BookState {}

class InicialState extends BookState {}

class LoadingState extends BookState {}

class ErrorBookState extends BookState {
  final Failure error;

  ErrorBookState({required this.error});
}

class GetBooksSuccess extends BookState {
  GetBooks books;
  GetBooksSuccess({required this.books});
}

class GetBookByIDSuccess extends BookState {
  BookByID book;
  GetBookByIDSuccess({required this.book});
}

class GetBookChaptersSuccess extends BookState {
  ChaptersBook chapters;
  GetBookChaptersSuccess({required this.chapters});
}
