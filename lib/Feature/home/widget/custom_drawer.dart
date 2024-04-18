
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key,required this.onTapDrawer});
  final Function? onTapDrawer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width*0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: Constants.mediaQuery.width,
            height: 160,
            color: const Color(0xff39A552),
            child: Text(
              "News App!",
              style: Constants.theme.textTheme.titleLarge,
            ),
          ),
          InkWell(
            onTap: () {
              onTapDrawer!();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 25,bottom: 5),
              child: Row(
                children: [
                  const Icon(Icons.list_outlined,size: 35,color: Colors.black,),
                  const SizedBox(width: 8.0,),
                  Text("Categories",style: Constants.theme.textTheme.bodyLarge,)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
            child: Row(
              children: [
                const Icon(Icons.settings,size: 35,color: Colors.black,),
                const SizedBox(width: 8.0,),
                Text("Settings",style: Constants.theme.textTheme.bodyLarge,)
              ],
            ),
          ),

        ],
      ),

    );
  }
}
