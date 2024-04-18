import 'package:news_application/Feature/data/artical_Data_source/artical_data_source.dart';
import 'package:news_application/core/config/network/api_network.dart';

import '../../../models/ArticalDataModel.dart';

class OnlineArticalDataSource implements ArticalDataSource{
  ApiManager apiManager;
  OnlineArticalDataSource(this.apiManager);
  @override
  Future<List<Articles>>getDataArtical(String sourceId)async {
    return await apiManager.fetchDataArticals( sourceId);
  }

}