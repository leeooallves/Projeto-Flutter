import 'package:flutter/material.dart';
import 'package:projeto/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // int paginaAtual = 0;

  // late PageController pc;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App finanças',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
