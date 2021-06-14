import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/providers/transferencia_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'formulario.dart';

class ListaTransferencia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tranferência')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push<Transferencia>(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then((novaTransferencia) {
            debugPrint('$novaTransferencia');
            if (novaTransferencia != null) {
              Provider.of<TransferenciaProvider>(context, listen: false).adicionar(novaTransferencia);
            }
          });
         },
      ),
      body: Consumer<TransferenciaProvider>(
        builder: (context, transferencia, child) {
          return ListView.builder(
            itemCount: transferencia.listaTransferencias.length,
            itemBuilder: (context, index) {
              Transferencia item = transferencia.listaTransferencias[index];

              return ItemListaTransferencia(item);
            }
          );
        }
      )
    );
  }
}

class ItemListaTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemListaTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return
      Card(
        child: ListTile(
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.conta.toString()),
          leading: Icon(Icons.monetization_on),
        )
      );
  }
}
