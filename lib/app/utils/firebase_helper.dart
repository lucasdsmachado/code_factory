import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void handleFirebaseException(BuildContext context, FirebaseException e) {
  if (e.code != 'object-not-found') {
    showErrorSnackBar(context, "Erro ao atualizar imagem de perfil: $e");
  }
}
