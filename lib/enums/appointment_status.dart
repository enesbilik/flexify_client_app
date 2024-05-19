enum AppointmentStatus {
  empty(0),
  pending(1),
  accepted(2),
  rejected(3),
  completed(4),
  canceled(5);

  final int value;

  const AppointmentStatus(this.value);
}
