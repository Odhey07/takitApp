part of 'takit_cubit.dart';

@immutable
abstract class TakitState {}

class TakitInitial extends TakitState {}

class BottomNavState extends TakitState {}

class CreateTakitDatabaseState extends TakitState {}

class InsertDataToCarteState extends TakitState {}

class GetDataFromDatabaseState extends TakitState {}

class CarteTableIsEmptyState extends TakitState {}
