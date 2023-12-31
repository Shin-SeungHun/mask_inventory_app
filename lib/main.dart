import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:mask_inventory_app/ui/view/main_screen.dart';
import 'package:mask_inventory_app/viewmodel/store_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: StoreModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
