class MeasurementInputFactory extends ConsumerWidget {
  final String unidad;
  final ValueChanged<double> onChanged;
  final VoidCallback? onPhotoRequired;

  const MeasurementInputFactory({
    required this.unidad,
    required this.onChanged,
    this.onPhotoRequired,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (unidad.toLowerCase()) {
      case 'm2':
        return AreaInput(onChanged: onChanged, onPhoto: onPhotoRequired);
      case 'm':
        return LinearInput(onChanged: onChanged, onPhoto: onPhotoRequired);
      case 'pza':
      case 'und':
        return UnitCounter(onChanged: onChanged, onPhoto: onPhotoRequired);
      case 'sg':
        return GlobalPercentageInput(onChanged: onChanged, onPhoto: onPhotoRequired);
      default:
        return ManualInput(onChanged: onChanged, onPhoto: onPhotoRequired);
    }
  }
}
