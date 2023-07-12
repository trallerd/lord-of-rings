import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:dartz/dartz.dart';
import 'package:lord_of_rings/src/data/datasource/book/books_datasource_interface.dart';
import 'package:lord_of_rings/src/domain/entities/get_book_by_id.dart';
import 'package:lord_of_rings/src/domain/entities/get_books.dart';
import 'package:lord_of_rings/src/domain/entities/get_chapters_book.dart';
import 'package:lord_of_rings/src/failure/failure.dart';
import 'package:lord_of_rings/utils/utils.dart';

class BookDatasource implements BookDatasourceI {
  @override
  Future<Either<Failure, GetBooks>> getAllBooks() async {
    var url = Uri.https(baseUrl(), '/book');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return right(GetBooks.fromJson(json));
      }
      return left(APIFailure());
    } catch (e) {
      return left(APIFailure());
    }
  }

  @override
  Future<Either<Failure, BookByID>> getBookByID(String id) async {
    var url = Uri.https(baseUrl(), '/book/$id');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return right(BookByID.fromJson(json));
      }
      return left(APIFailure());
    } catch (e) {
      return left(APIFailure());
    }
  }

  @override
  Future<Either<Failure, ChaptersBook>> getBooksChapters(String id) async {
    var url = Uri.https(baseUrl(), 'book/$id/chapter');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return right(ChaptersBook.fromJson(json));
      }
      return left(APIFailure());
    } catch (e) {
      return left(APIFailure());
    }
  }
}
