import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sql_conn/sql_conn.dart';
import 'package:what_in_fridge/test_xampp.dart';
import 'package:what_in_fridge/views/screens/crud/list.dart';
import 'package:what_in_fridge/views/widgets/calendar.dart';


Future<void> main() async {

  // //todo test db
  // final Mysql db = Mysql();
  //
  // await db.getConnection().then((conn) async {
  //   // String sqlQuery = 'SELECT * FROM data1 WHERE label LIKE "%${sks.text.toString()}%" ;';
  //   String sqlQuery = 'SELECT * FROM `test_t`;';
  //   await conn.query(sqlQuery).then((value) {
  //     //Texts = value.toString();'
  //     print("XAMPP");
  //     for (var res in value) {
  //       print(res);
  //       // final profModel = Model(res["label"].toString(),res["Amount"] ,res["Type"].toString(),res["Date"],res["Time"],res["PaymentOption"].toString(),res["id"],);
  //       // profilelist.add(profModel);
  //     }
  //   }).onError((error, stackTrace) {
  //     print(error);
  //     return null;
  //   });
  // });

  //test SQL
  // await SqlConn.connect(
  //     // ip: "192.168.167.176",
  //     // port: "1433",
  //     // databaseName: "MyDatabase",
  //     // username: "admin123",
  //     // password: "Pass@123"
  //     ip: "DESKTOP-IBIIF13\SQLEXPRESS",
  //     port: "1433",
  //     databaseName: "AndroidApp",
  //     username: "",
  //     password: ""
  // );
  // var res = await SqlConn.readData("SELECT * FROM Table_1");
  // print("hello");
  // print(res.toString());


  runApp(
    // TODO: add provider scope above your app
    const ProviderScope(child: MyApp()),
  );

  //todo test db
  // final Mysql db = Mysql();
  //
  // await db.getConnection().then((conn) async {
  //   // String sqlQuery = 'SELECT * FROM data1 WHERE label LIKE "%${sks.text.toString()}%" ;';
  //   String sqlQuery = 'SELECT * FROM `test_t`;';
  //   await conn.query(sqlQuery).then((value) {
  //     //Texts = value.toString();'
  //     print("XAMPP");
  //     for (var res in value) {
  //       print(res);
  //       // final profModel = Model(res["label"].toString(),res["Amount"] ,res["Type"].toString(),res["Date"],res["Time"],res["PaymentOption"].toString(),res["id"],);
  //       // profilelist.add(profModel);
  //     }
  //   }).onError((error, stackTrace) {
  //     print(error);
  //     return null;
  //   });
  // });

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
      //todo 18-2-2023
      // home: const TableTest(),
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
