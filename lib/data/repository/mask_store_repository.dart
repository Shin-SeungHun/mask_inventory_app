import 'package:mask_inventory_app/data/data_source/mask_api.dart';
import 'package:mask_inventory_app/data/dto/mask_dto.dart';
import 'package:mask_inventory_app/data/mapper/store_mapper.dart';
import 'package:mask_inventory_app/data/model/store.dart';
import 'package:mask_inventory_app/data/repository/interface/store_repository.dart';
import 'package:latlong2/latlong.dart';

class MaskStoreRepository implements StoreRepository {
  final MaskApi _api = MaskApi();
  final _distance = const Distance();

  @override
  Future<List<Store>> getStoreList({
    required double lat,
    required double lng,
  }) async {
    final MaskDto dto = await _api.getMaskResult();

    if (dto.stores == null) {
      return [];
    }

    final List<Store> storeList = [];

    for (Stores storeData in dto.stores!) {
      final double distance = _distance.as(
        LengthUnit.Kilometer,
        LatLng(storeData.lat?.toDouble() ?? 0.0, storeData.lng?.toDouble() ?? 0.0),
        LatLng(lat, lng),
      );

      storeData.km = distance;

      if (storeData.remainStat == 'plenty' ||
          storeData.remainStat == 'some' ||
          storeData.remainStat == 'few') {
        storeList.add(storeData.toStore());
      }
    }

    return storeList;
  }
}
