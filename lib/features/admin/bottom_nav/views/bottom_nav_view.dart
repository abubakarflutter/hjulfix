import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/auth/repo/auth_repo.dart';

class BottomNavView extends ConsumerWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.read(authRepositoryProvider);
    final isLoggedIn = authRepo.isLoggedIn();

    return Scaffold(
      body: Center(
        child: Text("Logged In \n ${isLoggedIn ? "Logged In" : "Not Logged In"}",),
      ),
    );
  }
}