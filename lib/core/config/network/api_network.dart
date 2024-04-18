import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../models/ArticalDataModel.dart';
import '../../../models/sourceModelData.dart';
import '../constant.dart';
class ApiManager{
   Future<List<Sources>> getDataSource(String categoryId)async {
    //Uri url=Uri.parse("https://${Constants.baseUrl}/v2/top-headlines/sources?apiKey=${Constants.apiKey}");
    Uri url = Uri.https(
      Constants.baseUrl,
      "/v2/top-headlines/sources",
      {
        'apiKey': Constants.apiKey,
        "category": categoryId
      },
    );
    final response = await http.get(url);
    //print(response.body);
    List<Sources> sourceDataList=[];
    if(response.statusCode==200) {
      var data = jsonDecode(response.body);
        var sourceList = data["sources"];
        for(var element in sourceList) {
          sourceDataList.add(Sources.fromJson(element));
        }
        return sourceDataList;
      }
      else {
        throw Exception("failed");
      }
      }
       Future<List<Articles>> fetchDataArticals(String sourceId)async{
    Map<String,dynamic> params={
      "apiKey":Constants.apiKey,
      "sources": sourceId,
    };
   var url = Uri.https(
      Constants.baseUrl,
        "/v2/everything",
    params
    );
     final response= await http.get(url);
     if(response.statusCode==200){
       //print(response.body);
       var data=jsonDecode(response.body);
       List articlesList=data["articles"];
       ArticalDataModel articalDataModel =ArticalDataModel.fromJson(data);
       return articalDataModel.articles??[];
     }else
       {
         throw Exception("failed to get articles");
       }
}
Future<List<Articles>> search(String query,{int page = 1 })async{
     var dio = Dio(
       BaseOptions(baseUrl: "https://newsapi.org/v2/"),
     );
     dio.interceptors.add(
       PrettyDioLogger(responseBody: false)
     );
     final response =await dio.get(
       "/everything",
       queryParameters: {
         "q": query,
         "apiKey": Constants.apiKey,
         "page":page,
         "pageSize":20
       },

     );
     ArticalDataModel articalDataModel =ArticalDataModel.fromJson(response.data);
     return articalDataModel.articles??[];


}

    }