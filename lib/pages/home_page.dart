import 'package:flutter/material.dart';
import 'package:projeto/pages/despesas_page.dart';
import 'package:projeto/pages/financas_page.dart';
import 'package:projeto/pages/ganhos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [FinancasPage(), DespesasPage(), GanhoPage()],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lançamentos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.money_off), label: 'Despesas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: 'Ganhos'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
