import 'package:bytebank/providers/transferencia_provider.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransferenciaProvider()
        ),
      ],
      child: ByteBankApp()
    )
  );
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      )
    );
  }
}
