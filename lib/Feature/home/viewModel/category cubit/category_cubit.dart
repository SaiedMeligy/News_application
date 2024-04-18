import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Feature/data/news_data_source/news_data_source.dart';
import 'package:news_application/Feature/data/news_data_source/onnline_dataSource_imp.dart';
import 'package:news_application/Feature/home/viewModel/artical%20cubit/artical_states.dart';
import 'package:news_application/Feature/home/viewModel/category%20cubit/category_states.dart';

import 'package:news_application/core/config/network/api_network.dart';

import '../../../repository/news_source_repository/news_source_repository.dart';
import '../../../repository/news_source_repository/news_source_repository_imp.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit():super(LoadingCategoryState());
  late NewsSourceRepository newsSourceRepository;
  late NewsSourceDataSource newsSourceDataSource;
  late ApiManager apiManager;
  getDataSource( String categoryId)async{
    apiManager = ApiManager();
    newsSourceDataSource = OnlineDataSourceImp(apiManager);
    newsSourceRepository = NewsSourceRepositoryImp(newsSourceDataSource);

    emit(LoadingCategoryState());
    try {

      //var sourceList = await ApiManager().getDataSource(categoryId);
      var sourceList = await newsSourceRepository.getDataSource(categoryId);
     emit(SuccessCategoryState(sourceList));

    }catch(error){
      emit(ErrorCategoryState(error.toString()));
      print(error.toString());
    }
  }

}