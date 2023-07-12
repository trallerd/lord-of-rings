import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_of_rings/src/data/datasource/book/book_datasource.dart';
import 'package:lord_of_rings/src/data/datasource/book/books_datasource_interface.dart';
import 'package:lord_of_rings/src/presentation/blocs/book_bloc.dart';
import 'package:lord_of_rings/src/presentation/pages/home.dart';

import 'src/data/repositories/books_repository.dart';
import 'src/domain/repositories/book_repository_interface.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return BookBloc(
              repository: BookRepository(
                datasource: BookDatasource(),
              ),
            );
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
        ),
        home: const Scaffold(
          body: Home(),
        ),
      ),
    );
  }
}
