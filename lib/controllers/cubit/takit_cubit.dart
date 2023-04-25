import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tak_it_app/screens/my_contacts/my_contacts_screen.dart';
import 'package:tak_it_app/screens/my_qr_code/my_qr_screen.dart';
import 'package:tak_it_app/screens/setting/setting_screen.dart';

part 'takit_state.dart';

class TakitCubit extends Cubit<TakitState> {
  TakitCubit() : super(TakitInitial());

  //preparation des cubits
  static TakitCubit get(context) => BlocProvider.of(context);

  /**
   * Mise en place de la base de donnée
   */
  Database? database;

  void createDatabase() {
    openDatabase('takitdata', //nom du fichier de la db
        version: 1, onCreate: (database, version) {
      database.execute(
          //création de la table Carte
          '''
              CREATE TABLE carte(
              id INTEGER PRIMARY KEY,
              nom TEXT,
              prenom TEXT,
              mail TEXT,
              fonction TEXT,
              numero INTEGER);
          '''
          //creation de la table client
          ).then((value) {
        print("Table carte créée");
      }).catchError((error) {
        print('erreur lors de la création de la table carte');
      });
      database.execute('''
              CREATE TABLE contact(
              id INTEGER PRIMARY KEY,
              nom TEXT,
              prenom TEXT,
              mail TEXT,
              fonction TEXT,
              numero INTEGER);
          ''').then((value) {
        print("Table contact créée");
      }).catchError((error) {
        print('erreur lors de la création de la table contact');
      });
    }, onOpen: (database) {
      getDataFromCarte(database);
      print('le fichier de la base de donnée est ouvert');
    }).then((value) {
      database = value;
      emit(CreateTakitDatabaseState());
    }).catchError((onError) {
      print('une erreur lors de l\'ouverture de la base de donnée');
    });
  }

  //fonction pour inserer une carte

  void insertDataToCarte({
    required nom,
    required prenom,
    required mail,
    required fonction,
    required numero,
  }) {
    database?.transaction((txn) async {
      txn
          .rawInsert(
              //insertion des données dans la table carte
              'INSERT INTO carte'
              '(nom, prenom, mail, fonction, numero)'
              'VALUES ("$nom", "$prenom", "$mail", "$fonction", "$numero" )')
          .then((value) {
        print("$value bien enregistré");
        getDataFromCarte(database);
        emit(InsertDataToCarteState());
      }).catchError((error) {
        print("echec d'enregistrement des données de la carte");
      });
    });
  }

  //Fonction pour recuperer des données de la carte dans la db

  List cartes = [];

  void getDataFromCarte(database) {
    cartes = [];
    database!.rawQuery('SELECT * FROM carte').then((value) {
      value.forEach((element) {
        cartes.add(element);
      });
      print('les données ont bien été recuperé la carte $value');
      emit(GetDataFromDatabaseState());
    }).catchError((error) {
      print("echec de recuperation des données de la carte");
    });
  }









  /**
   *  initialisation des differentes pages
   *
   */
  int currentIndex = 1;

  List<Widget> Screens = [
    MyContactsScreen(),
    MyQrScreen(),
    SettingScreen(),
  ];

  void changeBottomNavigationItem(int? index) {
    currentIndex = index!;
    emit(BottomNavState());
  }
}
