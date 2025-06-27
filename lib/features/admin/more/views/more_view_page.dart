import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/widgets/base_scaffold.dart';

class MoreViewPage extends ConsumerWidget {
  const MoreViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
        title: "More",
        subtitle: "Settings, scanner, and tools",

        body: Column(
          children: [

          ],
        )
    );
  }
}