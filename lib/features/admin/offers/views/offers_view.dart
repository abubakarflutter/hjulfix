import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/widgets/base_scaffold.dart';

class OffersView extends ConsumerWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
        title: "Offers",
        subtitle: "Manage sent and draft offers",

        body: Column(
          children: [

          ],
        )
    );
  }
}