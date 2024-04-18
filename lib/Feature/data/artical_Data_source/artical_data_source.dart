import '../../../models/ArticalDataModel.dart';

abstract class ArticalDataSource{
  Future<List<Articles>>getDataArtical(String sourceId);

}