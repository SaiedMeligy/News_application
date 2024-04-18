import '../../../models/ArticalDataModel.dart';

abstract class ArticalRepository{
  Future<List<Articles>>getDataArticle(String sourceId);

}