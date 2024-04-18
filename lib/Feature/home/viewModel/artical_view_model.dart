import 'package:flutter/cupertino.dart';

import '../../../core/config/network/api_network.dart';
import '../../../models/ArticalDataModel.dart';


class ArticalViewModel extends ChangeNotifier {
  List<Articles> _articalsList = [];

  List<Articles> get articalsList => _articalsList;
  getDataArtical(String? sourceId) async {
    try {
      _articalsList = await ApiManager().fetchDataArticals(sourceId!);
      notifyListeners();
    }
    catch (e) {
      print(e.toString());
    }
  }
}