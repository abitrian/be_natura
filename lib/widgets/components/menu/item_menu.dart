// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/widgets/components/text/be_natura_text.dart';

class ItemMenu extends StatefulWidget {
  final String text;
  final StatefulWidget destination;

  const ItemMenu(this.text, this.destination, {super.key});

  @override
  _ItemMenu createState() => _ItemMenu();
}

class _ItemMenu extends State<ItemMenu> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          value ? _isHovering = true : _isHovering = false;
        });
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => widget.destination,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: BeNaturaText(widget.text,
                style: TextStyle(
                    color: _isHovering ? Colors.grey.shade50 : BeNaturaColors.lightFont),
                align: TextAlign.center,
                size: 18),
          ),
          const SizedBox(height: 1),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: _isHovering,
            child: Container(
              height: 2,
              width: 20,
              color: BeNaturaColors.lightFont,
            ),
          )
        ],
      ),
    );
  }
}
