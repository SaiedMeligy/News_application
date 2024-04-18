

import '../../../models/sourceModelData.dart';

abstract class NewsSourceRepository{
  Future<List<Sources>>getDataSource(String categoryId);
}