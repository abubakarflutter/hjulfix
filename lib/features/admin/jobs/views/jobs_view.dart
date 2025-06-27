import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/widgets/base_scaffold.dart';

class JobsView extends ConsumerWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VersatileScaffold(
        title: "Jobs",
        subtitle: "Track active and past jobs",

        body: Column(
        children: [

        ],
      )
    );
  }
}