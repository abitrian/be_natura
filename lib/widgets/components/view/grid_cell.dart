import 'package:be_natura/utils/screen_util.dart';
import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  const GridCell(this.url, {super.key});

  @required
  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
        const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 0.0, top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(url,
                width: ScreenUtil().getCellSize(context, 300),
                height: ScreenUtil().getCellSize(context, 300),
                alignment: Alignment.center,
                fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}