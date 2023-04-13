import 'package:flutter/material.dart';
import 'package:projeto/model/transacao.dart';
import 'package:projeto/pages/nova_transacao_page.dart';
import 'package:projeto/repositories/transacao_repository.dart';

class FinancasPage extends StatelessWidget {
  const FinancasPage({Key? key}) : super(key: key);

  novaTransacao() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const NovaTransacao(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final tabela = TransacaoRepository.transacoes;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Finanças')),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            padding: const EdgeInsets.all(15.0),
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(10),
                child: Text(
                  tabela.length.toString(),
                  style: TextStyle(
                      fontSize: 90,
                      letterSpacing: 5,
                      color: Colors.green.shade600),
                ),
              )),
          // ignore: prefer_const_constructors
          Flexible(
              flex: 3,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int transacao) {
                    return ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(200))),
                      leading: const Icon(Icons.attach_money_rounded,
                          color: Colors.red),
                      title: Text(tabela[transacao].titulo),
                      trailing: Text(tabela[transacao].valor.toString()),
                      selected: true,
                      selectedTileColor: Colors.indigo,
                    );
                  },
                  padding: EdgeInsets.all(16),
                  separatorBuilder: (_, ___) => Divider(),
                  itemCount: tabela.length))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // novaTransacao();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NovaTransacao(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
