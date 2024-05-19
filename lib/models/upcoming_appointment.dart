import 'dart:convert';

class UpcomingAppointment {
  final String? id;
  final String? startTime;
  final String? endTime;
  final String? consultantName;
  final String? consultantSurName;
  final String? consultantTitle;
  final String? consultantPhotoUrl;

  UpcomingAppointment({
    this.id,
    this.startTime,
    this.endTime,
    this.consultantName,
    this.consultantSurName,
    this.consultantTitle,
    this.consultantPhotoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'startTime': startTime,
      'endTime': endTime,
      'consultantName': consultantName,
      'consultantSurName': consultantSurName,
      'consultantTitle': consultantTitle,
      'consultantPhotoUrl': consultantPhotoUrl,
    };
  }

  factory UpcomingAppointment.fromMap(Map<String, dynamic> map) {
    return UpcomingAppointment(
      id: map['id'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      consultantName: map['consultantName'],
      consultantSurName: map['consultantSurName'],
      consultantTitle: map['consultantTitle'],
      consultantPhotoUrl: map['consultantPhotoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UpcomingAppointment.fromJson(String source) =>
      UpcomingAppointment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UpcomingAppointment(id: $id, startTime: $startTime, endTime: $endTime, consultantName: $consultantName, consultantSurName: $consultantSurName, consultantTitle: $consultantTitle, consultantPhotoUrl: $consultantPhotoUrl)';
  }
}
