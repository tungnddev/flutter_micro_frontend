import 'package:core/core.dart';
import 'package:product/src/data/mapper/data_mapper.dart';
import 'package:product/src/domain/repository.dart';

import '../domain/models/models.dart';
import 'remote/clients/remote_client.dart';
export '../domain/repository.dart';

class RepositoryImp extends Repository with ExceptionMapper {
  RemoteClient client;
  DataMapper mapper;

  RepositoryImp(this.client, this.mapper);

  @override
  Future<List<ProductItem>> fetchProductItems(int page, int limit) async {
    try {
      final response = await client.fetchProductItems(page, limit);
      return response.data?.map((e) => mapper.mapProductItem(e)).toList() ?? [];
    } catch (e) {
      throw mapException(e);
    }
  }
}
