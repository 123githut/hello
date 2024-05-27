// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: json['order_id'] as String?,
      advisorId: json['advisor_id'] as String?,
      situation: json['situation'] as String?,
      question: json['question'] as String?,
      price: (json['price'] as num?)?.toInt(),
      type: json['type'] as String?,
      advisor: json['advisor'] == null
          ? null
          : Advisor.fromJson(json['advisor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'advisor_id': instance.advisorId,
      'situation': instance.situation,
      'question': instance.question,
      'price': instance.price,
      'type': instance.type,
      'advisor': instance.advisor?.toJson(),
    };

Advisor _$AdvisorFromJson(Map<String, dynamic> json) => Advisor(
      advisorId: json['advisor_id'] as String?,
      advisorName: json['advisor_name'] as String?,
      advisorAvatar: json['advisor_avatar'] as String?,
      advisorDesc: json['advisor_desc'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdvisorToJson(Advisor instance) => <String, dynamic>{
      'advisor_id': instance.advisorId,
      'advisor_name': instance.advisorName,
      'advisor_avatar': instance.advisorAvatar,
      'advisor_desc': instance.advisorDesc,
      'services': instance.services,
    };

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      serviceName: json['service_name'] as String?,
      serviceDesc: json['service_desc'] as String?,
      servicePrice: (json['service_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'service_name': instance.serviceName,
      'service_desc': instance.serviceDesc,
      'service_price': instance.servicePrice,
    };
