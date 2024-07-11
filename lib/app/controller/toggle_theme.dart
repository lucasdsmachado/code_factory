import 'package:flutter/material.dart';

ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

void toggleTheme() {
  isDark.value = !isDark.value;
}
