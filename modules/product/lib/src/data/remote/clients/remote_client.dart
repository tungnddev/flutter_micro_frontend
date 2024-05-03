import 'package:core/core.dart';

import '../../models/models.dart';

part 'remote_client.g.dart';

@RestApi()
abstract class RemoteClient {
  factory RemoteClient(Dio dio) = _RemoteClient;

  @GET('/product')
  Future<BaseResponse<List<ProductItemModel>>> fetchProductItems(
      @Query("page") int page, @Query("limit") int limit);
}
