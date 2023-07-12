import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isConnected() async =>
    await InternetConnectionChecker().hasConnection;
