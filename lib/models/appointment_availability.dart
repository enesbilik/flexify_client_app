class AppointmentAvailability {
  List<AvailabilityData>? data;

  AppointmentAvailability({required this.data});

  factory AppointmentAvailability.fromJson(List<dynamic>? json) {
    List<AvailabilityData>? data =
        json?.map((item) => AvailabilityData.fromJson(item)).toList();
    return AppointmentAvailability(data: data);
  }
}

class AvailabilityData {
  String? day;
  List<TimeSlot>? timeSlots;

  AvailabilityData({required this.day, required this.timeSlots});

  factory AvailabilityData.fromJson(Map<String, dynamic>? json) {
    String? day = json?['day'];
    List<TimeSlot>? timeSlots = json?['timeSlots']
        ?.map<TimeSlot>((item) => TimeSlot.fromJson(item))
        .toList();
    return AvailabilityData(day: day, timeSlots: timeSlots);
  }
}

class TimeSlot {
  String? startTime;
  String? endTime;
  int? status;

  TimeSlot(
      {required this.startTime, required this.endTime, required this.status});

  factory TimeSlot.fromJson(Map<String, dynamic>? json) {
    String? startTime = json?['startTime'];
    String? endTime = json?['endTime'];
    int? status = json?['status'];
    return TimeSlot(startTime: startTime, endTime: endTime, status: status);
  }
}
