import '../../model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStoreList({
    required double lat,
    required double lng,
  });
}
