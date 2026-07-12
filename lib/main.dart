import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Phase 2/3 background init (WorkManager, home_widget callbacks, deep links)
  // is registered here later. Phase 1 boots straight into the offline app.
  runApp(const ProviderScope(child: SalitaApp()));
}
