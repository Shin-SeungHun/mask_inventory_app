// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mask_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaskDto _$MaskDtoFromJson(Map<String, dynamic> json) => MaskDto(
      count: json['count'] as num?,
      stores: (json['stores'] as List<dynamic>?)?.map(Stores.fromJson).toList(),
    );

Map<String, dynamic> _$MaskDtoToJson(MaskDto instance) => <String, dynamic>{
      'count': instance.count,
      'stores': instance.stores,
    };

Stores _$StoresFromJson(Map<String, dynamic> json) => Stores(
      addr: json['addr'] as String?,
      code: json['code'] as String?,
      createdAt: json['created_at'] as String?,
      lat: json['lat'] as num?,
      lng: json['lng'] as num?,
      name: json['name'] as String?,
      remainStat: json['remain_stat'] as String?,
      stockAt: json['stock_at'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$StoresToJson(Stores instance) => <String, dynamic>{
      'addr': instance.addr,
      'code': instance.code,
      'created_at': instance.createdAt,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'remain_stat': instance.remainStat,
      'stock_at': instance.stockAt,
      'type': instance.type,
    };
