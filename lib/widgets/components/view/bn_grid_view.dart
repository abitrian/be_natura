import 'package:be_natura/utils/screen_util.dart';
import 'package:be_natura/widgets/components/view/grid_cell.dart';
import 'package:flutter/material.dart';

class BNGridView {

  static Padding grid(
      List<String>? snapshot, Function gridClicked, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: snapshot?.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenUtil().getGridviewColumnCount(context)),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: GridCell(snapshot![index]),
            onTap: () => gridClicked(context, snapshot[index]),
          );
        },
      ),
    );
  }
  
}