import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_of_rings/src/domain/entities/get_books.dart';
import 'package:lord_of_rings/src/domain/repositories/book_repository_interface.dart';
import 'package:lord_of_rings/src/failure/failure.dart';
import '../../domain/entities/get_book_by_id.dart';
import '../../domain/entities/get_chapters_book.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepositoryI repository;
  BookBloc({required this.repository}) : super(InicialState()) {
    on<GetAllBooks>(_getAllBooks);
    on<GetBookByID>(_getBookByID);
    on<GetBookChapters>(_getBookChapters);
  }

  FutureOr<void> _getAllBooks(
    GetAllBooks event,
    Emitter<BookState> emit,
  ) async {
    emit(LoadingState());
    final response = await repository.getAllBooks();
    response.fold(
      (error) => emit(ErrorBookState(error: error)),
      (books) => emit(GetBooksSuccess(books: books)),
    );
  }

  FutureOr<void> _getBookByID(
    GetBookByID event,
    Emitter<BookState> emit,
  ) async {
    emit(LoadingState());
    final response = await repository.getBookByID(event.id);
    response.fold(
      (error) => emit(ErrorBookState(error: error)),
      (book) => emit(GetBookByIDSuccess(book: book)),
    );
  }

  FutureOr<void> _getBookChapters(
    GetBookChapters event,
    Emitter<BookState> emit,
  ) async {
    emit(LoadingState());
    final response = await repository.getBooksChapters(event.id);
    response.fold(
      (error) => emit(ErrorBookState(error: error)),
      (chapters) => emit(GetBookChaptersSuccess(chapters: chapters)),
    );
  }
}
