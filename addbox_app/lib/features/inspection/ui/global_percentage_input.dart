import 'package:flutter/material.dart';

class GlobalPercentageInput extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final VoidCallback? onPhoto;

  const GlobalPercentageInput({
    super.key,
    required this.onChanged,
    this.onPhoto,
  });

  @override
  State<GlobalPercentageInput> createState() => _GlobalPercentageInputState();
}

class _GlobalPercentageInputState extends State<GlobalPercentageInput> {
  double _value = 0;

  void _update(double v) {
    setState(() => _value = v);
    widget.onChanged(v);
    if (v > 0) widget.onPhoto?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Avance Global (%)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Slider(
          value: _value,
          min: 0,
          max: 100,
          divisions: 20,
          label: "${_value.toInt()}%",
          onChanged: _update,
        ),
        Text("Avance: ${_value.toInt()}%", style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
