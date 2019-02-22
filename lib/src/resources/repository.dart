import 'package:demo_vipimo_flutter/src/models/item_model.dart';
import 'package:demo_vipimo_flutter/src/resources/data_api_provider.dart';

class Repository {
  final moviesApiProvider = DataApiProvider();

  Future<ItemModel> fetchAllData() =>
      moviesApiProvider.fetchTemperatureData();
}
