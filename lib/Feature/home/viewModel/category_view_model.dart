import 'package:flutter/material.dart';

import '../../../core/config/network/api_network.dart';
import '../../../models/sourceModelData.dart';


class CategoryViewModel extends ChangeNotifier{
  List<Sources> _sourceList = [];
  List<Sources> get sourceList => _sourceList;

  getDataSource(String categoryId)async{
    try {
      _sourceList = await ApiManager().getDataSource(categoryId);
      notifyListeners();
    }
    catch(e){
      print(e.toString());
    }
  }
}