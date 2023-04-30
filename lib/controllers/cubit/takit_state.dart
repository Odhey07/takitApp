part of 'takit_cubit.dart';

@immutable
abstract class TakitState {}

class TakitInitial extends TakitState {}

class BottomNavState extends TakitState {}

class CreateTakitDatabaseState extends TakitState {}

class InsertDataToCarteState extends TakitState {}

class GetDataFromTableContactState extends TakitState {}

class GetDataFromTableCarteState extends TakitState {}


class InsertDataToContactState extends TakitState {}

class InsertingDataToContacSuccestState extends TakitState {}

class LoadingGetDataFromContactState extends TakitState {}

class QrCodeState extends TakitState {}

class CarteTableIsEmptyState extends TakitState {}
