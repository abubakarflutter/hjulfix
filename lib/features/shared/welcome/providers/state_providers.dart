import 'package:flutter_riverpod/flutter_riverpod.dart';

final localLoaderProvider = StateProvider.autoDispose<bool>((ref) => false);
