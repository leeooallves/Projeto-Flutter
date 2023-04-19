import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/model/transacao.dart';
import 'package:projeto/repositories/transacao_repository.dart';

class NovaTransacao extends StatefulWidget {
  final TransacaoRepository transacoesRepository;
  // final Function() save;
  const NovaTransacao({
    Key? key,
    required this.transacoesRepository,
    // required this.save,
  }) : super(key: key);

  @override
  State<NovaTransacao> createState() => _NovaTransacaoState();
}

class _NovaTransacaoState extends State<NovaTransacao> {
  final _form = GlobalKey<FormState>();
  final _descricao = TextEditingController();
  final _valor = TextEditingController();
  final _tipoLancamento = TextEditingController();
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Despesa', 'Ganho'];

  novaTransacao() {
    if (_form.currentState!.validate()) {
      // Navigator.pop(context);
      widget.transacoesRepository.salvarLancamento(Transacao(
          titulo: _descricao.text,
          valor: double.parse(_valor.text),
          tipo: true));

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Novo lançamento realizado com sucesso')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Novo lançamento')),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descrição da despesa'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe uma descrição';
                    }
                  },
                  controller: _descricao,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Valor da despesa',
                      prefixIcon: Icon(Icons.monetization_on_rounded),
                      suffix: Text(
                        'Reais',
                        style: TextStyle(fontSize: 12),
                      )),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o valor da despesa';
                    } else if (double.parse(value) < 0.01) {
                      return 'Informe um valor maior que R\$0,01';
                    }
                    return null;
                  },
                  controller: _valor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      child: Text('data'),
                      value: 'texte',
                    ),
                  ],
                  onChanged: (value) {},
                  isExpanded: true,
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () => novaTransacao(),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
                  icon: const Icon(
                    Icons.check,
                  ),
                  label: Text('Lançar Despesa')),
            ],
          ),
        ),
      ),
    );
  }
}
