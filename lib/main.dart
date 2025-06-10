import 'package:flutter/material.dart';
import 'form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3.2 Flutter Push Pop',
      debugShowCheckedModeBanner: false, // Elimina la bandera de debug
      themeMode: ThemeMode.system,
      theme: ThemeData( // Añade tema claro
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      darkTheme: ThemeData( // Añade tema oscuro
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MyForm(),
    );
  }
}