import 'package:dartz/dartz.dart';
import '../../failure/failure.dart';
import '../entities/get_book_by_id.dart';
import '../entities/get_books.dart';
import '../entities/get_chapters_book.dart';

abstract class BookRepositoryI {
  Future<Either<Failure, GetBooks>> getAllBooks();
  Future<Either<Failure, BookByID>> getBookByID(String id);
  Future<Either<Failure, ChaptersBook>> getBooksChapters(String id);
}
