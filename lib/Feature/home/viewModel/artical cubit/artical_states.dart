import 'package:news_application/models/ArticalDataModel.dart';

sealed class ArticalState {}
class LoadingArticalState extends ArticalState{}
class SuccessArticalState extends ArticalState{
  List<Articles> articalList;
  SuccessArticalState(this.articalList);
}
class ErrorArticalState extends ArticalState{
  String errorMessage;
  ErrorArticalState(this.errorMessage);
}