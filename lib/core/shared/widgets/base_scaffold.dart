import 'package:flutter/material.dart';

import '../../utils/media_query.dart';

class BaseScaffold extends StatelessWidget {
  final Widget page;
  const BaseScaffold({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: SizedBox(
              width: isTablet()
                  ? MediaQuery.of(context).size.width * 0.60
                  : null,
              child: page,
            ),
          );
        },
      ),
    );
  }
}
