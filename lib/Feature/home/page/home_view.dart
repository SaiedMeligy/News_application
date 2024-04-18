import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/Feature/search/search_page.dart';

import '../../../core/config/constant.dart';
import '../../../core/widget/custom_background_widget.dart';
import '../../../main.dart';
import '../../../models/category_model.dart';
import '../widget/custom_drawer.dart';
import '../widget/custom_item_widget.dart';
import 'category_view.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoryList = [
    CategoryModel(
        id: "Sports",
        title: 'Sports',
        image: 'assets/images/sports.png',
        backgroundColor: const Color(0xffC91C22)),
    CategoryModel(
      id: "general",
      title: 'Politics',
      image: 'assets/images/Politics.png',
      backgroundColor: const Color(0xff003E90),
    ),
    CategoryModel(
      id: "health",
      title: 'Health',
      image: 'assets/images/health.png',
      backgroundColor: const Color(0xffED1E79),
    ),
    CategoryModel(
      id: "business",
      title: 'business',
      image: 'assets/images/bussines.png',
      backgroundColor: const Color(0xffCF7E48),
    ),
    CategoryModel(
      id: "entertainment",
      title: 'Environment',
      image: 'assets/images/environment.png',
      backgroundColor: const Color(0xff4882CF),
    ),
    CategoryModel(
      id: "science",
      title: 'Science',
      image: 'assets/images/science.png',
      backgroundColor: const Color(0xffF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory==null? 'News App':selectedCategory!.title, style: Constants.theme.textTheme.titleLarge),
          actions:  [
            GestureDetector(
              onTap: (){
                showSearch(context: context, delegate: SearchPage());
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.search),
              ),
            ),

          ],
        ),
        drawer: CustomDrawer(onTapDrawer:onTapDrawer),
        body:
        selectedCategory==null?
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pick your category\n of interest',
                style: Constants.theme.textTheme.bodyLarge!.copyWith(
                  color: const Color(0xff4F5A69),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 4 / 5),
                  itemBuilder: (context, index) => CustomItemWidget(
                      index: index,
                      categoryModel: categoryList[index],
                      onCategoryClicked: onCategoryClicked),
                  itemCount: 6,
                ),
              )
            ],
          ),
        ):CategoryView(categoryModel: selectedCategory),
      ),
    );
  }
  CategoryModel? selectedCategory;

  void onCategoryClicked(CategoryModel categoryModel) {
    selectedCategory=categoryModel;
    setState(() {

    });

  }
  void onTapDrawer(){
    setState(() {
      selectedCategory=null;
      navigatorKey.currentState!.pop();
    });
  }
}
