// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_master_class/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../configs/themes/app_color.dart';

class ContentArea extends StatelessWidget {
  final bool addpadding;
  final Widget child;
  const ContentArea({
    Key? key,
    this.addpadding = true,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        padding: addpadding
            ? EdgeInsets.only(
                top: mobileScreenpadding,
                left: mobileScreenpadding,
                right: mobileScreenpadding)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: customScaffoldColor(context),
        ),
        child: child,
      ),
    );
  }
}
