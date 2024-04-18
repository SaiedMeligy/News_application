
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';
import '../../../models/category_model.dart';


class CustomItemWidget extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final Function? onCategoryClicked;
  const CustomItemWidget({super.key,required this.index,required this.categoryModel, this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onCategoryClicked== null) return;
        onCategoryClicked!(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
            color:categoryModel.backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft:index%2==0?const Radius.circular(25.0):const Radius.circular(0.0),
              bottomRight: index % 2 == 0 ?const Radius.circular(0.0):const Radius.circular(25.0),
              topLeft:const Radius.circular(25) ,
              topRight: const Radius.circular(25),
            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image,fit: BoxFit.cover,),
            Text(categoryModel.title,style: Constants.theme.textTheme.bodyMedium!.copyWith(
              color: Colors.white
            ),),
          ],
        ),
      ),
    );
  }
}
