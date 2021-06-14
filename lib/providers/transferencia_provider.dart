import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class TransferenciaProvider extends ChangeNotifier {
  final List<Transferencia> listaTransferencias = [];

  adicionar(Transferencia item) {
    this.listaTransferencias.add(item);
    notifyListeners();
  }
}