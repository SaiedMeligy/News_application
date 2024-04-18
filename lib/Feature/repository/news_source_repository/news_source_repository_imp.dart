import 'package:news_application/Feature/data/news_data_source/news_data_source.dart';
import 'package:news_application/models/ArticalDataModel.dart';
import 'package:news_application/models/sourceModelData.dart';

import 'news_source_repository.dart';

class NewsSourceRepositoryImp implements NewsSourceRepository {

  NewsSourceDataSource newsSourceDataSource;
  NewsSourceRepositoryImp(this.newsSourceDataSource);
  @override
  Future<List<Sources>> getDataSource(String categoryId) async{
    return await newsSourceDataSource.getDataSource(categoryId);
  }
}