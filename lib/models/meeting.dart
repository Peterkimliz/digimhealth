import 'package:digimhealth/models/user_model.dart';

class Meeting {
  String? id;
  UserModel? doctorId;
  String? meetingDate;
  String? meetingHour;
  UserModel? patientId;
  String? meetingType;
  String? status;
  String? duration;
  int? price;

  Meeting(
      {this.price,
      this.status,
      this.doctorId,
      this.duration,
      this.meetingDate,
      this.meetingHour,
      this.meetingType,
      this.patientId,
      this.id});
}
