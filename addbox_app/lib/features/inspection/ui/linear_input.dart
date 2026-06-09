import 'package:flutter/material.dart';
import '../../../core/ble/bosch_laser_service.dart';

class LinearInput extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final VoidCallback? onPhoto;

  const LinearInput({
    super.key,
    required this.onChanged,
    this.onPhoto,
  });

  @override
  State<LinearInput> createState() => _LinearInputState();
}

class _LinearInputState extends State<LinearInput> {
  double? _valor;
  final BoschLaserService _laser = BoschLaserService();

  Future<void> _medir() async {
    final value = await _laser.triggerMeasurement();
    setState(() => _valor = value);
    widget.onChanged(value);
    widget.onPhoto?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Medición Lineal (m)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        ElevatedButton.icon(
          icon: const Icon(Icons.straighten),
          label: const Text("Medir distancia"),
          onPressed: _medir,
        ),

        const SizedBox(height: 10),

        Text(
          _valor != null ? "Resultado: ${_valor!.toStringAsFixed(2)} m" : "Sin medir",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
