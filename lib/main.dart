import 'package:flutter/material.dart';
import 'package:flutter_bloc_graphql_sample/core/di/injection.dart';
import 'package:flutter_bloc_graphql_sample/core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GraphQL BLoC Sample',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      routerConfig: AppRouter.router,
    );
  }
}
