// ignore_for_file: depend_on_referenced_packages
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/core/failure.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/core/success.dart';
import 'package:helixworlds_snatcher_sdk/features/analytics/mixpanels/analytics_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/auth/auth_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/scan_repository.dart';
import 'package:helixworlds_snatcher_sdk/features/user_details/user_details_repository.dart';
import 'package:helixworlds_snatcher_sdk/utils/helper_util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';

abstract class IHelixworldsSDKService {
  // call this method in order to set whole SDK env to production environment
  Future<Either<Failure, Success>> setForProduction();

  /// set isAR = true then it will process the image detection using amazon rekognition
  Future<Either<Failure, Success>> scanItem({String? email});
  Future<Either<Failure, Success>> scanItemsByAR(XFile image, {String? email});

  Future<Either<Failure, String>> getUserId();
  Future<Either<Failure, Success>> cacheFavoritesItem(InventoryItemModel model);
  Future<Either<Failure, Success>> deleteFavoriteItem(MyLogModel model);
  Future<Either<Failure, List<MyLogModel>>> fetchFavoritesItems();
  Future<Either<Failure, List<MyLogModel>>> fetchScannedItems();
  Future<Either<Failure, Success>> redirectToUrl(InventoryItemModel model);
  bool isLocalFetch();
  String getDefaultUserId();

  /// analytics mixpanel tracking event
  AnalyticsRepository? getAnalyticsRepoService();

  /// auth gatherer just pass the developerId provided by metaverse group and secret key to be able to access our scanning api service features
  Future<Either<Failure, Success>> loginMobile(
    String developerId,
    String secret,
    String uuid,
  );
  Future<Either<Failure, Success>> cacheValorToken(String token);

  Future<Either<Failure, String>> getAccessToken();
}

class HelixworldsSDKService extends IHelixworldsSDKService {
  final IUserDetailsRepository userDetailsRepo;
  final ScanRepository scanRepo;
  final ILogLocalDatasource logLocaDatasource;
  final IAuthLocalDatasource _authLocalDS;
  final ImagePicker picker;
  final HelperUtil _helperUtil;
  final bool isLocal;
  HelixworldsSDKService(this.userDetailsRepo, this.scanRepo,
      this.logLocaDatasource, this.picker, this._helperUtil, this._authLocalDS,
      {this.isLocal = true});

  @override
  Future<Either<Failure, Success>> scanItem({String? email}) async {
    try {
      var image =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
      var result = await scanItemsByAR(image!, email: email);
      return result;
    } catch (e) {
      return Left(ItemNotDetectedFailure());
    }
  }

  String? userId = "";
  @override
  Future<Either<Failure, String>> getUserId() async {
    try {
      if (userId?.isEmpty ?? false) {
        var result = await userDetailsRepo.getUserID();
        result.fold((l) => null, (r) {
          userId = r;
        });
        if (result.isRight()) {
          var rightResult = result.fold((l) => null, (r) => r);
          return Right(rightResult ?? "");
        } else {
          return Left(GetUserIDFailure());
        }
      } else {
        return Right(userId!);
      }
    } catch (e) {
      return Left(GetUserIDFailure());
    }
  }

  @override
  String getDefaultUserId() {
    if (userId?.isNotEmpty ?? false) {
      return userId ?? "";
    } else {
      return "";
    }
  }

  @override
  Future<Either<Failure, Success>> cacheFavoritesItem(
      InventoryItemModel model) {
    var itemResult = scanRepo.cacheSavedItem(model);
    return itemResult;
  }

  @override
  Future<Either<Failure, List<MyLogModel>>> fetchFavoritesItems() async {
    var result = await logLocaDatasource.getSavedItems();
    return result;
  }

  @override
  Future<Either<Failure, List<MyLogModel>>> fetchScannedItems() async {
    var result = await logLocaDatasource.getLogs();
    return result;
  }

  @override
  Future<Either<Failure, Success>> redirectToUrl(
      InventoryItemModel model) async {
    var accessTokenResult = await getAccessToken();
    var accessToken = accessTokenResult.fold((l) => null, (r) => r) ?? "";
    var result = await _helperUtil.redirectUrl(model, accessToken: accessToken);
    if (result.isRight()) {
      return Right(RedirectWebSuccess());
    } else {
      return const Left(WebRouteFailure(""));
    }
  }

  @override
  bool isLocalFetch() {
    return isLocal;
  }

  @override
  Future<Either<Failure, Success>> scanItemsByAR(XFile image,
      {String? email}) async {
    var result = await scanRepo.processImageAR(image, email: email);

    var rightResult = result.fold((l) => null, (r) => r);
    if (result.isRight()) {
      return Right(ObjectDetectedSuccess(rightResult!, getDefaultUserId()));
    } else {
      return Left(ItemNotDetectedFailure());
    }
  }

  @override
  AnalyticsRepository? getAnalyticsRepoService() {
    try {
      return getAnalyticsRepo();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<Failure, Success>> loginMobile(
      String developerId, String secret, String uuid,
      {String field = "destination"}) async {
    try {
      var result = await getAuthRepo()
          .mobileLogin(developerId, secret, uuid, field: field);
      return result;
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> setForProduction() async {
    try {
      setToProduction();
      return Right(HSSSuccess());
    } catch (e) {
      return Left(HSSDKFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> deleteFavoriteItem(MyLogModel model) {
    var itemResult = scanRepo.deleteSavedItem(model);
    return itemResult;
  }

  @override
  Future<Either<Failure, Success>> cacheValorToken(String token) async {
    var result = await _authLocalDS.cacheValorAccessToken(token);
    return result;
  }

  @override
  Future<Either<Failure, String>> getAccessToken() async {
    var result = await _authLocalDS.getGathererAccessToken();
    return result;
  }
}
