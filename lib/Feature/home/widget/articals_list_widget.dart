
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Feature/home/viewModel/artical%20cubit/artical_cubit.dart';
import 'package:news_application/Feature/home/viewModel/artical%20cubit/artical_states.dart';

import 'artical_item_widget.dart';

class ArticalListWidget extends StatefulWidget {
   final String? sourceId;
   const ArticalListWidget({super.key, required this.sourceId});

  @override
  State<ArticalListWidget> createState() => _ArticalListWidgetState();
}

class _ArticalListWidgetState extends State<ArticalListWidget> {

  //var viewModel=ArticalViewModel();
  var articalViewModel = ArticalCubit();
  @override
  void initState() {
    super.initState();
    articalViewModel.getDataArtical(widget.sourceId??"");
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticalCubit,ArticalState>(
      bloc: articalViewModel,
        builder:(context, state) {
          switch (state) {
            case SuccessArticalState():
              {
                var articalList = state.articalList;
                return Expanded(
                  child: ListView.builder(
                    itemCount: articalList.length,
                    itemBuilder: (context, index) {
                      return ArticalItemWidget(artical: articalList[index]);
                    },
                  ),
                );
              }

            case LoadingArticalState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ErrorArticalState():
              {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
          }
        }

    );

  }
}
