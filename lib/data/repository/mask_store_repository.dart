import 'package:mask_inventory_app/data/data_source/mask_api.dart';
import 'package:mask_inventory_app/data/dto/mask_dto.dart';
import 'package:mask_inventory_app/data/mapper/store_mapper.dart';
import 'package:mask_inventory_app/data/model/store.dart';
import 'package:mask_inventory_app/data/repository/interface/store_repository.dart';

class MaskStoreRepository implements StoreRepository {
  final MaskApi _api = MaskApi();

  @override
  Future<List<Store>> getStoreList() async {
    final MaskDto dto = await _api.getMaskResult();

    if (dto.stores == null) {
      return [];
    }

    return dto.stores!
        .where((e) =>
            e.remainStat == 'plenty' ||
            e.remainStat == 'some' ||
            e.remainStat == 'few')
        .map((e) => e.toStore())
        .toList();
  }
}
