import 'package:news_application/Feature/data/artical_Data_source/artical_data_source.dart';

import '../../../models/ArticalDataModel.dart';
import 'artical_repository.dart';

class ArticalRepositoryImp implements ArticalRepository{
   final ArticalDataSource articalDataSource;
  ArticalRepositoryImp(this.articalDataSource);
  @override
  Future<List<Articles>> getDataArticle(String sourceId) async{
    return await articalDataSource.getDataArtical(sourceId);
  }
  }