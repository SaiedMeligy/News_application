import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_application/Feature/home/widget/artical_item_widget.dart';
import 'package:news_application/core/config/network/api_network.dart';
import 'package:news_application/models/ArticalDataModel.dart';

class SearchBodyPage extends StatefulWidget {
  final String query;
  const SearchBodyPage({super.key,required this.query});

  @override
  State<SearchBodyPage> createState() => _SearchBodyPageState();
}

class _SearchBodyPageState extends State<SearchBodyPage> {
  final PagingController<int, Articles> _pagingController =
  PagingController(firstPageKey: 1);
  @override
  void initState() {
    _pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
    super.initState();
  }
   _fetchPage(int page)async {
      try {
        var response = await ApiManager().search(widget.query,page: page);
        var isLastPage = response.length < 20;
        if (isLastPage) {
          _pagingController.appendLastPage(response??[]);
        } else {
          _pagingController.appendPage(response??[],page+1);
        }
      } catch (error) {
        _pagingController.error = error;
      }
    }
  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Articles>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Articles>(
        itemBuilder: (context, item, index) => ArticalItemWidget(
          artical: item,
        ),
      ),
    );
  }
}
