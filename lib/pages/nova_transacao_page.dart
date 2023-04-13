import 'package:flutter/material.dart';

class NovaTransacao extends StatefulWidget {
  const NovaTransacao({super.key});

  @override
  State<NovaTransacao> createState() => _NovaTransacaoState();
}

class _NovaTransacaoState extends State<NovaTransacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo lançamento'),
        backgroundColor: Colors.indigo,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descrição da despesa'),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o valor da despesa';
                      } else if (double.parse(value) < 0.01) {
                        return 'Informe um valor maior que R\$0,01';
                      }
                      return null;
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
