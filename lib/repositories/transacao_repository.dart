import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:projeto/model/transacao.dart';

class TransacaoRepository extends ChangeNotifier {
  final List<Transacao> lancamentos = [];
  // Carteira? carteira;
  UnmodifiableListView<Transacao> get transacoes =>
      UnmodifiableListView(lancamentos);

  salvarLancamento(Transacao lancamento) {
    lancamentos.add(lancamento);
    notifyListeners();
  }

  somaLancamentos() {
    // for (var i = 0; i < lancamentos.length; i++) {
    //   if (lancamentos[i].tipo == true) {
    //     carteira?.saldo += lancamentos[i].valor;
    //   } else {
    //     carteira?.saldo -= lancamentos[i].valor;
    //   }
    // }
    // return carteira?.saldo;
  }

  TransacaoRepository() {
    lancamentos.addAll([
      Transacao(titulo: 'testando1', valor: 50.55, tipo: true),
      Transacao(titulo: 'testando2', valor: 50.56, tipo: false),
      // Transacao(
      //     id: '3',
      //     titulo: 'testando3',
      //     valor: 50.57,
      //     data: '12/12/2022',
      //     tipo: true),
      // Transacao(
      //     id: '2',
      //     titulo: 'testando2',
      //     valor: 50.56,
      //     data: '12/12/2022',
      //     tipo: true),
      // Transacao(
      //     id: '3',
      //     titulo: 'testando3',
      //     valor: 50.57,
      //     data: '12/12/2022',
      //     tipo: true),
      // Transacao(
      //     id: '2',
      //     titulo: 'testando2',
      //     valor: 50.56,
      //     data: '12/12/2022',
      //     tipo: false),
      // Transacao(
      //     id: '3',
      //     titulo: 'despesa',
      //     valor: 10.60,
      //     data: '12/12/2022',
      //     tipo: false),
    ]);
    notifyListeners();
  }

  List<Transacao> getDespesas() {
    return lancamentos.where((transacao) => transacao.tipo == false).toList();
  }

  List<Transacao> getGanhos() {
    return lancamentos.where((transacao) => transacao.tipo == true).toList();
  }
}
