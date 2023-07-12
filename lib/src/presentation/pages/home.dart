import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_of_rings/src/presentation/blocs/book_bloc.dart';

import '../../domain/entities/get_books.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GetBooks books;
  late BookBloc bloc;

  @override
  void initState() {
    books = GetBooks();
    bloc = context.read<BookBloc>();
    bloc.add(GetAllBooks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Lord of Rings'),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetBooksSuccess) {
            books = state.books;
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: books.total,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      books.docs?[index].name ?? '0',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
