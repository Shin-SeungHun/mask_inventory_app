import '../dto/mask_dto.dart';
import '../model/store.dart';

extension DtoToModel on Stores {
  Store toStore() {
    return Store(
      addr: addr ?? '',
      code: code ?? '',
      createdAt: createdAt ?? '',
      lat: lat ?? 0,
      lng: lng ?? 0,
      name: name ?? '',
      remainStat: remainStat ?? 'empty',
      stockAt: stockAt ?? '',
      type: type ?? '',
    );
  }
}
