import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  @JsonKey(name:'order_id')
  String? orderId;
  @JsonKey(name:'advisor_id')
  String? advisorId;
  @JsonKey(name:'situation')
  String? situation;
  @JsonKey(name:'question')
  String? question;
  @JsonKey(name:'price')
  int? price;
  @JsonKey(name:'type')
  String? type;
  @JsonKey(name:'advisor')
  Advisor? advisor;

  Order({
    this.orderId,
    this.advisorId,
    this.situation,
    this.question,
    this.price,
    this.type,
    this.advisor,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Advisor {
  @JsonKey(name:'advisor_id')
  String? advisorId;
  @JsonKey(name:'advisor_name')
  String? advisorName;
  @JsonKey(name:'advisor_avatar')
  String? advisorAvatar;
  @JsonKey(name:'advisor_desc')
  String? advisorDesc;
  @JsonKey(name:'services')
  List<Services>? services;

  Advisor({
    this.advisorId,
    this.advisorName,
    this.advisorAvatar,
    this.advisorDesc,
    this.services,
  });

  factory Advisor.fromJson(Map<String, dynamic> json) => _$AdvisorFromJson(json);

  Map<String, dynamic> toJson() => _$AdvisorToJson(this);
}

@JsonSerializable()
class Services {
  @JsonKey(name:'service_name')
  String? serviceName;
  @JsonKey(name:'service_desc')
  String? serviceDesc;
  @JsonKey(name:'service_price')
  int? servicePrice;

  Services({
    this.serviceName,
    this.serviceDesc,
    this.servicePrice,
  });

  factory Services.fromJson(Map<String, dynamic> json) => _$ServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}
