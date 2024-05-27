import 'package:hive/hive.dart';
part 'advisor_model.g.dart';

@HiveType(typeId: 0)
class Advisors {
  @HiveField(0)
  String? advisorId;
  @HiveField(1)
  String? advisorName;
  @HiveField(2)
  String? advisorAvatar;
  @HiveField(3)
  String? advisorDesc;
  @HiveField(4)
  List<Services>? services;

  Advisors({
    this.advisorId,
    this.advisorName,
    this.advisorAvatar,
    this.advisorDesc,
    this.services,
  });
}
@HiveType(typeId: 1)
class Services {
  @HiveField(0)
  String? serviceName;
  @HiveField(1)
  String? serviceDesc;
  @HiveField(2)
  int? servicePrice;

  Services({
    this.serviceName,
    this.serviceDesc,
    this.servicePrice,
  });
}