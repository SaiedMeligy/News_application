

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Feature/data/artical_Data_source/artical_data_source.dart';
import 'package:news_application/Feature/data/artical_Data_source/online_Artical_data_source.dart';
import 'package:news_application/Feature/data/news_data_source/news_data_source.dart';
import 'package:news_application/Feature/data/news_data_source/onnline_dataSource_imp.dart';
import 'package:news_application/Feature/home/viewModel/artical%20cubit/artical_states.dart';

import 'package:news_application/Feature/repository/artical_repository/artical_repository.dart';
import 'package:news_application/Feature/repository/artical_repository/artical_repository_imp.dart';

import 'package:news_application/core/config/network/api_network.dart';

class ArticalCubit extends Cubit<ArticalState>{
  ArticalCubit():super(LoadingArticalState());
  late ArticalRepository articalRepository;
  late ArticalDataSource articalDataSource;
  late ApiManager apiManager;
  getDataArtical(String sourceId)async {
    apiManager = ApiManager();
    articalDataSource = OnlineArticalDataSource(apiManager);
    articalRepository = ArticalRepositoryImp(articalDataSource);
    emit(LoadingArticalState());
    try {
       // var articalList = await ApiManager().fetchDataArticals(sourceId);

      var articalList = await articalRepository.getDataArticle(sourceId);
      emit(SuccessArticalState(articalList));


    }catch(error){
      emit(ErrorArticalState(error.toString()));
      print(error.toString());
    }
  }

}