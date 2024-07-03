// Mocks generated by Mockito 5.4.2 from annotations
// in helixworlds_snatcher_sdk/test/features/scan/data/scan_screen_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:helixworlds_snatcher_sdk/core/failure.dart' as _i5;
import 'package:helixworlds_snatcher_sdk/core/success.dart' as _i6;
import 'package:helixworlds_snatcher_sdk/features/auth/auth_local_datasource.dart'
    as _i8;
import 'package:helixworlds_snatcher_sdk/features/log/data/log_local_datasource.dart'
    as _i3;
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ILogLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockILogLocalDatasource extends _i1.Mock
    implements _i3.ILogLocalDatasource {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Success>> cacheSaveItems(
          List<_i7.MyLogModel>? logs) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheSaveItems,
          [logs],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>.value(
            _FakeEither_0<_i5.Failure, _i6.Success>(
          this,
          Invocation.method(
            #cacheSaveItems,
            [logs],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>.value(
                _FakeEither_0<_i5.Failure, _i6.Success>(
          this,
          Invocation.method(
            #cacheSaveItems,
            [logs],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.MyLogModel>>> getSavedItems() =>
      (super.noSuchMethod(
        Invocation.method(
          #getSavedItems,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i7.MyLogModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i7.MyLogModel>>(
          this,
          Invocation.method(
            #getSavedItems,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i7.MyLogModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i7.MyLogModel>>(
          this,
          Invocation.method(
            #getSavedItems,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i7.MyLogModel>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Success>> cacheLogs(
          List<_i7.MyLogModel>? logs) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheLogs,
          [logs],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>.value(
            _FakeEither_0<_i5.Failure, _i6.Success>(
          this,
          Invocation.method(
            #cacheLogs,
            [logs],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>.value(
                _FakeEither_0<_i5.Failure, _i6.Success>(
          this,
          Invocation.method(
            #cacheLogs,
            [logs],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.MyLogModel>>> getLogs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLogs,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i7.MyLogModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i7.MyLogModel>>(
          this,
          Invocation.method(
            #getLogs,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i7.MyLogModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i7.MyLogModel>>(
          this,
          Invocation.method(
            #getLogs,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i7.MyLogModel>>>);
}

/// A class which mocks [IAuthLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthLocalDatasource extends _i1.Mock
    implements _i8.IAuthLocalDatasource {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Success>> cacheValorAccessToken(
          String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheValorAccessToken,
          [token],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>.value(
            _FakeEither_0<_i5.Failure, _i6.Success>(
          this,
          Invocation.method(
            #cacheValorAccessToken,
            [token],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>.value(
                _FakeEither_0<_i5.Failure, _i6.Success>(
          this,
          Invocation.method(
            #cacheValorAccessToken,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> getValorAccessToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #getValorAccessToken,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #getValorAccessToken,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, String>>.value(
                _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #getValorAccessToken,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Success>> cacheGathererAccessToken(
          String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheGathererAccessToken,
          [token],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>.value(
            _FakeEither_0<_i5.Failure, _i6.Success>(
          this,
          Invocation.method(
            #cacheGathererAccessToken,
            [token],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>.value(
                _FakeEither_0<_i5.Failure, _i6.Success>(
          this,
          Invocation.method(
            #cacheGathererAccessToken,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Success>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> getGathererAccessToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #getGathererAccessToken,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #getGathererAccessToken,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, String>>.value(
                _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #getGathererAccessToken,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);
}
