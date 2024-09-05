import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = const PostsBlocObserver();
  runApp(const MyApp());
}