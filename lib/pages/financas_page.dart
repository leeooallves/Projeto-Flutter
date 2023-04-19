import 'package:flutter/material.dart';
import 'package:projeto/model/carteira.dart';
import 'package:projeto/pages/nova_transacao_page.dart';
import 'package:projeto/repositories/transacao_repository.dart';

class FinancasPage extends StatefulWidget {
  const FinancasPage({Key? key}) : super(key: key);

  @override
  State<FinancasPage> createState() => _FinancasPageState();
}

class _FinancasPageState extends State<FinancasPage> {
  final TransacaoRepository transacaoRepository = TransacaoRepository();
  late final Carteira carteira;

  despesas(int transacao) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(200))),
      leading: const Icon(Icons.attach_money_rounded, color: Colors.red),
      tileColor: Colors.indigo,
      title: Text(
        transacaoRepository.transacoes[transacao].titulo,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Text(transacaoRepository.transacoes[transacao].valor.toString(),
          style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // carteira = transacaoRepository.somaLancamentos();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Finanças')),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(10),
                child: Text(
                  transacaoRepository.lancamentos.length.toString(),
                  style: TextStyle(
                      fontSize: 70,
                      letterSpacing: 4,
                      color: Colors.green.shade600),
                ),
              )),
          // ignore: prefer_const_constructors
          Flexible(
              flex: 3,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int transacao) =>
                      despesas(transacao),
                  padding: EdgeInsets.all(16),
                  separatorBuilder: (_, ___) => Divider(),
                  itemCount: transacaoRepository.transacoes.length))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // novaTransacao();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NovaTransacao(
                transacoesRepository: transacaoRepository,
                // save: () => {},
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
