import 'package:flutter/material.dart';

class ManualInput extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final VoidCallback? onPhoto;

  const ManualInput({
    super.key,
    required this.onChanged,
    this.onPhoto,
  });

  @override
  State<ManualInput> createState() => _ManualInputState();
}

class _ManualInputState extends State<ManualInput> {
  final TextEditingController _controller = TextEditingController();

  void _update(String value) {
    final parsed = double.tryParse(value) ?? 0;
    widget.onChanged(parsed);
    if (parsed > 0) widget.onPhoto?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Entrada Manual", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Valor",
            border: OutlineInputBorder(),
          ),
          onChanged: _update,
        ),
      ],
    );
  }
}
