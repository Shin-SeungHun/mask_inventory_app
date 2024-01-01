import 'package:json_annotation/json_annotation.dart';

part 'mask_dto.g.dart';

@JsonSerializable()
class MaskDto {
  num? count;
  List<Stores>? stores;

  MaskDto({
    this.count,
    this.stores,
  });

  factory MaskDto.fromJson(dynamic json) {
    return _$MaskDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MaskDtoToJson(this);
  }
}

@JsonSerializable()
class Stores {
  String? addr;
  String? code;
  @JsonKey(name: 'created_at')
  String? createdAt;
  double? lat;
  double? lng;
  String? name;
  @JsonKey(name: 'remain_stat')
  String? remainStat;
  @JsonKey(name: 'stock_at')
  String? stockAt;
  String? type;
  num? km;

  Stores({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainStat,
    this.stockAt,
    this.type,
    this.km
  });

  factory Stores.fromJson(dynamic json) {
    return _$StoresFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StoresToJson(this);
  }
}
