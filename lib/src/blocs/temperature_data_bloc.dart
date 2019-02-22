import 'package:demo_vipimo_flutter/src/models/item_model.dart';
import 'package:demo_vipimo_flutter/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TemperatureData {
  final _repository = Repository();
  final _dataFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allData => _dataFetcher.stream;

  fetchAllData() async {
    ItemModel itemModel = await _repository.fetchAllData();
    _dataFetcher.sink.add(itemModel);
  }

  dispose() {
    _dataFetcher.close();
  }
}

final bloc = TemperatureData();
