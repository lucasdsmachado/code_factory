// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SwitchCards extends StatefulWidget {
  final String cardTitle;
  final IconData cardIcon;
  final Color trackColor;
  // TODO Função para mudar o modo da tela dark/light
  //TODO icones de sol e lua

  const SwitchCards({
    super.key,
    required this.cardTitle,
    required this.cardIcon,
    required this.trackColor,
  });

  @override
  State<SwitchCards> createState() => _SwitchCardsState();
}

bool notificationsValue = true;

class _SwitchCardsState extends State<SwitchCards> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 1),
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: ListTile(
            leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    widget.cardIcon,
                    color: Colors.white,
                    size: 14,
                  ),
                )),
            title: Text(
              widget.cardTitle,
              style: const TextStyle(
                fontVariations: [FontVariation('wght', 500)],
                fontSize: 20,
              ),
            ),
            trailing: Switch(
              value: notificationsValue,
              activeTrackColor: widget.trackColor,
              onChanged: (bool value) {
                setState(() {
                  notificationsValue = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
