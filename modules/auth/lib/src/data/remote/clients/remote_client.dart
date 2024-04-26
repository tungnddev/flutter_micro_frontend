import 'package:core/core.dart';

import '../../models/models.dart';

part 'remote_client.g.dart';

@RestApi()
abstract class RemoteClient {
  factory RemoteClient(Dio dio) = _RemoteClient;

  @POST('/refresh_token')
  Future<BaseResponse<String>> refreshToken(@Field("refreshToken") String refreshToken);

  @POST('/login')
  Future<BaseResponse<LoginModel>> login(@Body() LoginRequestModel model);
}