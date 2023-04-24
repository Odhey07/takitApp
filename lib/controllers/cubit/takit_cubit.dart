import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'takit_state.dart';

class TakitCubit extends Cubit<TakitState> {
  TakitCubit() : super(TakitInitial());

  static TakitCubit get(context) => BlocProvider.of(context);


}

