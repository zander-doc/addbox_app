import 'package:flutter/material.dart';

class UnitCounter extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final VoidCallback? onPhoto;

  const UnitCounter({
    super.key,
    required this.onChanged,
    this.onPhoto,
  });

  @override
  State<UnitCounter> createState() => _UnitCounterState();
}

class _UnitCounterState extends State<UnitCounter> {
  int _count = 0;

  void _update(int value) {
    setState(() => _count += value);
    if (_count < 0) _count = 0;

    widget.onChanged(_count.toDouble());
    if (_count > 0) widget.onPhoto?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Conteo de Unidades", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle, size: 32),
              onPressed: () => _update(-1),
            ),
            Text("$_count", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.add_circle, size: 32),
              onPressed: () => _update(1),
            ),
          ],
        ),
      ],
    );
  }
}
