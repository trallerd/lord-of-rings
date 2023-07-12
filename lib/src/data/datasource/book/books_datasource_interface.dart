import 'package:dartz/dartz.dart';
import 'package:lord_of_rings/src/domain/entities/get_book_by_id.dart';
import 'package:lord_of_rings/src/domain/entities/get_books.dart';
import 'package:lord_of_rings/src/domain/entities/get_chapters_book.dart';
import 'package:lord_of_rings/src/failure/failure.dart';

abstract class BookDatasourceI {
  Future<Either<Failure, GetBooks>> getAllBooks();
  Future<Either<Failure, BookByID>> getBookByID(String id);
  Future<Either<Failure, ChaptersBook>> getBooksChapters(String id);
}
