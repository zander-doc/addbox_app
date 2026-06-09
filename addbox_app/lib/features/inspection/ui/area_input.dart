import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ble/bosch_laser_service.dart';

class AreaInput extends ConsumerStatefulWidget {
  final ValueChanged<double> onChanged;
  final VoidCallback? onPhoto;

  const AreaInput({
    super.key,
    required this.onChanged,
    this.onPhoto,
  });

  @override
  ConsumerState<AreaInput> createState() => _AreaInputState();
}

class _AreaInputState extends ConsumerState<AreaInput> {
  double? _largo;
  double? _ancho;

  final BoschLaserService _laser = BoschLaserService();

  Future<void> _medirLargo() async {
    final value = await _laser.triggerMeasurement();
    setState(() => _largo = value);
    _calcular();
  }

  Future<void> _medirAncho() async {
    final value = await _laser.triggerMeasurement();
    setState(() => _ancho = value);
    _calcular();
  }

  void _calcular() {
    if (_largo != null && _ancho != null) {
      final m2 = _largo! * _ancho!;
      widget.onChanged(m2);
      widget.onPhoto?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Medición de Área (m²)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        Row(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.straighten),
              label: const Text("Largo"),
              onPressed: _medirLargo,
            ),
            const SizedBox(width: 10),
            Text(_largo != null ? "${_largo!.toStringAsFixed(2)} m" : "---"),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.straighten),
              label: const Text("Ancho"),
              onPressed: _medirAncho,
            ),
            const SizedBox(width: 10),
            Text(_ancho != null ? "${_ancho!.toStringAsFixed(2)} m" : "---"),
          ],
        ),

        const SizedBox(height: 15),

        Text(
          "Área total: ${((_largo ?? 0) * (_ancho ?? 0)).toStringAsFixed(2)} m²",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
