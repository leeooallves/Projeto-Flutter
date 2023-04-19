import 'package:flutter/material.dart';

import '../model/transacao.dart';
import '../repositories/transacao_repository.dart';

class GanhoPage extends StatefulWidget {
  const GanhoPage({super.key});

  @override
  State<GanhoPage> createState() => _GanhoPageState();
}

class _GanhoPageState extends State<GanhoPage> {
  final TransacaoRepository transacaoRepository = TransacaoRepository();
  List<Transacao> transacoes = [];
  @override
  Widget build(BuildContext context) {
    transacoes = transacaoRepository.getGanhos();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Ganhos')),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Flexible(
              flex: 3,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int transacao) {
                    return ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(200))),
                      leading: const Icon(Icons.attach_money_rounded,
                          color: Colors.green),
                      tileColor: Colors.indigo,
                      title: Text(
                        transacoes[transacao].titulo.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        transacoes[transacao].valor.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                  padding: EdgeInsets.all(16),
                  separatorBuilder: (_, ___) => Divider(),
                  itemCount: transacoes.length)),
        ],
      ),
    );
  }
}
