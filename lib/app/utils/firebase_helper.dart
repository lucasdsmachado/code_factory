import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
    ),
  );
}

void handleFirebaseException(BuildContext context, FirebaseException e) {
  switch (e.code) {
    case 'object-not-found':
      break;
    case 'user-not-found':
      showErrorSnackBar(context, "Usuário não encontrado.");
      break;
    case 'wrong-password':
      showErrorSnackBar(context, "Senha incorreta");
      break;
    case 'email-already-in-use':
      showErrorSnackBar(context, "O email já está em uso.");
    case 'weak-password':
      showErrorSnackBar(context, "A senha é muito fraca.");
      break;
    default:
      showErrorSnackBar(context, 'Erro: $e');
      break;
  }
}

void showSucessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
    ),
  );
}
