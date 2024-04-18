

import 'package:flutter/material.dart';
import 'package:news_application/Feature/home/widget/tab_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/sourceModelData.dart';
import '../viewModel/artical_view_model.dart';
import 'articals_list_widget.dart';

// class NewsList extends StatefulWidget {
//   final List<Sources> sourceList;
//    const NewsList({super.key,required this.sourceList});
//
//   @override
//   State<NewsList> createState() => _NewsListState();
// }
//
// class _NewsListState extends State<NewsList> {
//   int selectedIndex=0;
//   var viewModel=ArticalViewModel();
//   @override
//   void initState() {
//     // TODO: implement initState
//     viewModel.getDataArtical(widget.sourceList[selectedIndex].id);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => viewModel,
//       child: Consumer<ArticalViewModel>(
//         builder: (context, value, child) {
//           return
//             Column(
//             children: [
//               DefaultTabController(length:widget.sourceList.length , child:
//               TabBar(
//                 onTap: (value){
//                   selectedIndex=value;
//                   setState(() {
//                     viewModel.getDataArtical(
//                       widget.sourceList[selectedIndex].id,
//                     );
//                   });
//                 },
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 isScrollable: true,
//                 dividerColor: Colors.transparent,
//                 labelPadding: const EdgeInsets.symmetric(horizontal: 6),
//                 indicator: const BoxDecoration(),
//                 tabs: widget.sourceList
//                     .map((e) => TabItemWidget(sourceModel: e, isselected:
//                 selectedIndex ==  widget.sourceList.indexOf(e)))
//                     .toList(),
//               ),
//               ),
//               ArticalListWidget(sourceId: widget.sourceList[selectedIndex].id)
//
//             ],
//           );
//
//         },
//       ),
//     ) ;
//   }
// }
class NewsList extends StatefulWidget {
  final List<Sources> sourceList;
  const NewsList({super.key, required this.sourceList});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ArticalViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.sourceList.length, vsync: this);
    viewModel = ArticalViewModel();
    viewModel.getDataArtical(widget.sourceList[0].id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ArticalViewModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              TabBar(
                controller: _tabController,
                onTap: (index) {
                  viewModel.getDataArtical(widget.sourceList[index].id);
                },
                padding: const EdgeInsets.symmetric(vertical: 10),
                isScrollable: true,
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                indicator: const BoxDecoration(),
                tabs: widget.sourceList
                    .map((e) => TabItemWidget(sourceModel: e, isselected: widget.sourceList.indexOf(e) == _tabController.index))
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: widget.sourceList
                      .map((e) => ArticalListWidget(sourceId: e.id)).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

