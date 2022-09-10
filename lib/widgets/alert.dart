import 'package:flutter/material.dart';
import 'package:test_mottu/controllers/home.controller.dart';

class AlertCustom {
  final BuildContext context;
  AlertCustom(this.context);

  Widget AlertDialogError() {
    return AlertDialog(
      title: const Text('É necessário no minimo dois nomes para o sorteio'),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Fechar'),
        ),
      ],
    );
  }

  Widget AlertDialogRandom({required HomeController homeController}) {
    return AlertDialog(
      title: Text('Parabéns ${homeController.nameRandom} você foi Sorteado'),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Fechar'),
        ),
        MaterialButton(
          onPressed: () {
            homeController.clearList();
            Navigator.pop(context);
          },
          child: const Text('Novo Sorteio'),
        )
      ],
    );
  }
}
