import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ralp/ui/root_page/root_page.dart';

import '../firebase_options.dart';
import '../theme/primary_theme.dart';
import '../util/ui/routes.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final materialApp = FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, state) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "RALP",
              theme: PrimaryTheme.generateTheme(context),
              home: const RootView(),
              onGenerateRoute: Routes.generator,
            ));

    return materialApp;
  }
}
