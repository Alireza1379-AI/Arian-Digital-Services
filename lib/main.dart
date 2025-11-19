import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'routing/app_router.dart';
import 'ui/theme/pixel_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const ArianApp());
}

class ArianApp extends StatelessWidget {
  const ArianApp({super.key});

  static final _router = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Arian Digital Services',
      debugShowCheckedModeBanner: false,
      theme: PixelTheme.buildTheme(),
      routerConfig: _router,
    );
  }
}
