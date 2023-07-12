part of 'book_bloc.dart';

abstract class BookEvent {}

class GetAllBooks extends BookEvent {}

class GetBookByID extends BookEvent {
  final String id;
  GetBookByID(this.id);
}

class GetBookChapters extends BookEvent {
  final String id;
  GetBookChapters(this.id);
}
