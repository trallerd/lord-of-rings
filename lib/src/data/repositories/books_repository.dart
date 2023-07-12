import 'package:dartz/dartz.dart';
import 'package:lord_of_rings/infrastruture/connection.dart';
import 'package:lord_of_rings/src/data/datasource/book/books_datasource_interface.dart';
import 'package:lord_of_rings/src/domain/entities/get_book_by_id.dart';
import 'package:lord_of_rings/src/domain/entities/get_books.dart';
import 'package:lord_of_rings/src/domain/entities/get_chapters_book.dart';
import 'package:lord_of_rings/src/domain/repositories/book_repository_interface.dart';
import 'package:lord_of_rings/src/failure/failure.dart';

class BookRepository implements BookRepositoryI {
  final BookDatasourceI datasource;

  BookRepository({required this.datasource});
  @override
  Future<Either<Failure, GetBooks>> getAllBooks() async {
    if (await isConnected()) {
      return datasource.getAllBooks();
    }
    return left(RepositoryFailure());
  }

  @override
  Future<Either<Failure, BookByID>> getBookByID(String id) async {
    if (await isConnected()) {
      return datasource.getBookByID(id);
    }
    return left(RepositoryFailure());
  }

  @override
  Future<Either<Failure, ChaptersBook>> getBooksChapters(String id) async {
    if (await isConnected()) {
      return datasource.getBooksChapters(id);
    }
    return left(RepositoryFailure());
  }
}
