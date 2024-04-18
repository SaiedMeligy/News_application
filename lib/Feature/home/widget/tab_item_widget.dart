
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';
import '../../../models/sourceModelData.dart';

class TabItemWidget extends StatelessWidget {
 final Sources sourceModel;
  bool isselected;
   TabItemWidget({super.key,required this.sourceModel, required this.isselected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
      decoration: BoxDecoration(
        color: isselected?Constants.theme.primaryColor:Colors.transparent,
            border: Border.all(
          color: Colors.green,
              width: 2
      ),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Text(
        sourceModel.name,
        style: Constants.theme.textTheme.bodyMedium!.copyWith(
          color:isselected?Colors.white:Constants.theme.primaryColor,
        )
      ),
    );
  }
}
