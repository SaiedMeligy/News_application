import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Feature/home/viewModel/category%20cubit/category_cubit.dart';



import '../../../core/widget/custom_background_widget.dart';
import '../../../models/category_model.dart';
import '../viewModel/category cubit/category_states.dart';
import '../widget/news_list_wiget.dart';

class CategoryView extends StatefulWidget {
  CategoryModel? categoryModel;
  CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  //var viewModel =CategoryViewModel();
  var cubitViewModel = CategoryCubit();

  @override
  void initState() {
    super.initState();
    //viewModel.getDataSource(widget.categoryModel!.id);
    cubitViewModel.getDataSource(widget.categoryModel!.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit,CategoryState>(
      bloc: cubitViewModel,
      builder: (context, state) {
        switch (state){
          case SuccessCategoryState():{
            var sourceList = state.sourceList;
            return CustomBackgroundWidget(
          child: NewsList(sourceList: sourceList)
          );
          }
          case LoadingCategoryState():{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          case ErrorCategoryState():{
            return Center(
              child: Text(state.errorMessage??""),
            );
          }
        }
      },
    );

    // return ChangeNotifierProvider(
    //   create: (context) =>viewModel ,
    //   child: Consumer<CategoryViewModel>(
    //     builder: (context, viewModel, child) {
    //       if(viewModel.sourceList.isEmpty){
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       return CustomBackgroundWidget(
    //         child: NewsList(sourceList: viewModel.sourceList),
    //
    //
    //         // FutureBuilder(
    //         //     future: ApiManager.getDataSource(widget.categoryModel!.id),
    //         //     builder: (context, snapshot) {
    //         //       if (snapshot.hasError) {
    //         //         return const Center(
    //         //           child: Text("Something went wrong"),
    //         //         );
    //         //       }
    //         //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         //         return const Center(
    //         //           child: CircularProgressIndicator(),
    //         //         );
    //         //       }
    //         //       var sourceList = snapshot.data ?? [];
    //         //       return NewsList(sourceList: sourceList);
    //         //       //   ListView.builder(
    //         //       //   itemBuilder: (context, index) => Text(sourceList[index].name),
    //         //       //   itemCount: sourceList.length,
    //         //       // );
    //         //     })
    //       );
    //
    //     }
    //   ),
    // );
  }
}
