import 'package:news_application/Feature/data/news_data_source/news_data_source.dart';

import '../../../core/config/network/api_network.dart';
import '../../../models/sourceModelData.dart';


class OnlineDataSourceImp implements NewsSourceDataSource{
  final ApiManager apiManager;
  OnlineDataSourceImp( this.apiManager);
  @override
  Future<List<Sources>>getDataSource(String categoryId) async{
    var sourceList = await apiManager.getDataSource(categoryId);
    return sourceList;
  }


}