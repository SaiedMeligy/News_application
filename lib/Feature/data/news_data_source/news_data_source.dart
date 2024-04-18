import '../../../models/sourceModelData.dart';

abstract class NewsSourceDataSource{
  Future<List<Sources>>getDataSource(String categoryId);
}