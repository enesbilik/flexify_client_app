import 'dart:convert';

class AppointmentDetail {
  final String? startTime;
  final String? endTime;
  final int? status;
  final String? consultantName;
  final String? consultantSurName;
  final String? consultantLocation;
  AppointmentDetail({
    this.startTime,
    this.endTime,
    this.status,
    this.consultantName,
    this.consultantSurName,
    this.consultantLocation,
  });

  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'status': status,
      'consultantName': consultantName,
      'consultantSurName': consultantSurName,
      'consultantLocation': consultantLocation,
    };
  }

  factory AppointmentDetail.fromMap(Map<String, dynamic> map) {
    return AppointmentDetail(
      startTime: map['startTime'],
      endTime: map['endTime'],
      status: map['status']?.toInt(),
      consultantName: map['consultantName'],
      consultantSurName: map['consultantSurName'],
      consultantLocation: map['consultantLocation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentDetail.fromJson(String source) =>
      AppointmentDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppointmentDetail(startTime: $startTime, endTime: $endTime, status: $status, consultantName: $consultantName, consultantSurName: $consultantSurName, consultantLocation: $consultantLocation)';
  }
}
