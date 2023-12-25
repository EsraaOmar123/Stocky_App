part of 'app_cubit.dart';

abstract class AppStates {}

class ChangeNavBarState extends AppStates {}

class AppInitial extends AppStates {}

class CreateDataBaseSuccessState extends AppStates {}

class CreateDataBaseErrorState extends AppStates {}

class OpenDataBaseSuccessState extends AppStates {}

// insert into database

class InsertIntoDataBaseSuccessState extends AppStates {}

class InsertIntoDataBaseErrorState extends AppStates {}

// get from database

class GetDataFromDatabaseLoadingState extends AppStates {}

class GetDataFromDatabaseSuccessState extends AppStates {}

class GetDataFromDatabaseErrorState extends AppStates {}

// update from database

class UpdateDataSuccessState extends AppStates {}

class UpdateDataErrorState extends AppStates {}

class DeleteDataSuccessState extends AppStates {}

class DeleteDataErrorState extends AppStates {}

// get data from firebase

class GetDataErrorState extends AppStates {}

class GetDataSuccessState extends AppStates {}

class LoadingDataState extends AppStates {}

class SearchError extends AppStates {}

class SearchSuccess extends AppStates {}
