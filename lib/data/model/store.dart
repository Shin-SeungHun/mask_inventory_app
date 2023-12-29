import 'package:json_annotation/json_annotation.dart';
// part 'store.g.dart';

// @JsonSerializable()
class Store {
  String addr;
  String code;
  String createdAt;
  num lat;
  num lng;
  String name;
  String remainStat;
  String stockAt;
  String type;

//<editor-fold desc="Data Methods">
  Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          runtimeType == other.runtimeType &&
          addr == other.addr &&
          code == other.code &&
          createdAt == other.createdAt &&
          lat == other.lat &&
          lng == other.lng &&
          name == other.name &&
          remainStat == other.remainStat &&
          stockAt == other.stockAt &&
          type == other.type);

  @override
  int get hashCode =>
      addr.hashCode ^
      code.hashCode ^
      createdAt.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      name.hashCode ^
      remainStat.hashCode ^
      stockAt.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'Store{ addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type,}';
  }

  Store copyWith({
    String? addr,
    String? code,
    String? createdAt,
    num? lat,
    num? lng,
    String? name,
    String? remainStat,
    String? stockAt,
    String? type,
  }) {
    return Store(
      addr: addr ?? this.addr,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      remainStat: remainStat ?? this.remainStat,
      stockAt: stockAt ?? this.stockAt,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'createdAt': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remainStat': remainStat,
      'stockAt': stockAt,
      'type': type,
    };
  }

  factory Store.fromMap(Map<String, dynamic> json) {
    return Store(
      addr: json['addr'] as String,
      code: json['code'] as String,
      createdAt: json['createdAt'] as String,
      lat: json['lat'] as num,
      lng: json['lng'] as num,
      name: json['name'] as String,
      remainStat: json['remainStat'] as String,
      stockAt: json['stockAt'] as String,
      type: json['type'] as String,
    );
  }

//</editor-fold>
}
