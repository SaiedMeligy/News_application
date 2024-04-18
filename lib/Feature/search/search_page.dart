import 'package:flutter/material.dart';
import 'package:news_application/Feature/home/widget/artical_item_widget.dart';
import 'package:news_application/Feature/search/search_body_page.dart';
import 'package:news_application/core/config/network/api_network.dart';

class SearchPage extends SearchDelegate {


  @override
  List<Widget>? buildActions(BuildContext context) {
   return [IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,))];
  }
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Color(0xff39A552),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      )
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.close,color: Colors.white,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchBodyPage(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ApiManager().search(query);
    return FutureBuilder(
        future: ApiManager().search(query), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(),);
      }
      if (snapshot.hasError) {
        return Center(child: Text("some Thing went rong"),);
      }
      if (snapshot.hasData) {
        var articals = snapshot.data ?? [];
        return ListView.builder(
          itemCount: articals.length,
          itemBuilder: (context, index) {
            return ArticalItemWidget(artical: articals[index]);
          },
        );
      }
      return Center(child: Text("some Thing went rong"),);
    }

    );
  }
}
