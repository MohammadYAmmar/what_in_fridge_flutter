import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_in_fridge/views/screens/crud/list.dart';


void main() {
  runApp(
    // TODO: add provider scope above your app
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What is in fridge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const IngredientList(),
    );
  }

//TODO go router
// final GoRouter _router = GoRouter(
//   routes: <GoRoute>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const IngredientList();
//       },
//     ),
//     GoRoute(
//       path: '/update',
//       builder: (BuildContext context, GoRouterState state) {
//         return UpdateIngredient();
//       },
//     ),
//   ],
// );
}
