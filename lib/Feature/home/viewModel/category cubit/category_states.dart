import 'package:news_application/models/sourceModelData.dart';

sealed class CategoryState{}
//class InitialState extends CategoryState{}
class LoadingCategoryState extends CategoryState{}
class SuccessCategoryState extends CategoryState{
   List<Sources> sourceList;
  SuccessCategoryState(this.sourceList);
}
class ErrorCategoryState extends CategoryState{
  String? errorMessage;
  ErrorCategoryState(this.errorMessage);
}