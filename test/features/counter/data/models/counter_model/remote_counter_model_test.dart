import 'package:clean_architecture_counter/core/core.dart';
import 'package:clean_architecture_counter/features/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Data - Model RemoteCounter', () {
    const RemoteCounterModel remoteCounterModel = RemoteCounterModel(id: 1);

    test('get field count test', () {
      expect(remoteCounterModel.id, 1);
    });
    test('toEntity() test', () {
      final CounterEntity counterEntity = remoteCounterModel.toEntity();
      expect(counterEntity, isA<CounterEntity>());
      expect(counterEntity.toString(), 'CounterEntity(count: 1)');
    });
    test('toJson() test', () {
      expect(remoteCounterModel.toJson(), '{"id":1}');
    });
    test('toMap() test', () {
      expect(remoteCounterModel.toMap(), {'id': 1});
    });
    test("toString() test", () {
      expect(remoteCounterModel.toString(), 'RemoteCounterModel(id: 1)');
    });
    test('factory RemoteCounterModel fromEntity() test', () {
      final RemoteCounterModel remoteCounterModel =
          RemoteCounterModel.fromEntity(const CounterEntity(count: 1));
      expect(remoteCounterModel, isA<RemoteCounterModel>());
      expect(
        remoteCounterModel.toString(),
        'RemoteCounterModel(id: 1)',
      );
    });
    test('factory RemoteCounterModel fromJson() test', () {
      const String dataJson = '{"id":2000}';
      final RemoteCounterModel remoteCounterModel =
          RemoteCounterModel.fromJson(dataJson);
      expect(remoteCounterModel, isA<RemoteCounterModel>());
      expect(remoteCounterModel.toString(), 'RemoteCounterModel(id: 2000)');
    });
    test('factory RemoteCounterModel fromJson() failure test', () {
      try {
        const String dataJson = '{"CountB":2000}';
        RemoteCounterModel.fromJson(dataJson);
      } on InvalidJSONResponseException catch (e) {
        expect(
          e.toString(),
          endsWith("Invalid JSON response - Key not found = ['id']; "
              "Current HTTP data = {CountB: 2000}"),
        );
        expect(e.missingKeys, ['id']);
      }
    });
    test('factory RemoteCounterModel fromMap() [id String] test', () {
      const Map<String, dynamic> dataMap = {
        'count': 2000,
        'id': '1000',
        'countB': 500,
      };
      final RemoteCounterModel remoteCounterModel =
          RemoteCounterModel.fromMap(dataMap);
      expect(remoteCounterModel, isA<RemoteCounterModel>());
      expect(
        remoteCounterModel.toString(),
        'RemoteCounterModel(id: 1000)',
      );
    });
    test('factory RemoteCounterModel fromMap() [countB String] test', () {
      const Map<String, dynamic> dataMap = {
        'count': 2000,
        'id': 1000,
        'countB': '500',
      };
      final RemoteCounterModel remoteCounterModel =
          RemoteCounterModel.fromMap(dataMap);
      expect(remoteCounterModel, isA<RemoteCounterModel>());
      expect(
        remoteCounterModel.toString(),
        'RemoteCounterModel(id: 1000)',
      );
    });
    test('factory RemoteCounterModel fromMap() failure test', () {
      try {
        const Map<String, dynamic> dataMap = {
          'count': '1000',
          'countB': 500,
        };
        RemoteCounterModel.fromMap(dataMap);
      } on InvalidJSONResponseException catch (e) {
        expect(
          e.toString(),
          contains("Invalid JSON response - Key not found = ['id']; "
              "Current HTTP data = {count: 1000, countB: 500}"),
        );
        expect(e.missingKeys, ['id']);
      }
    });
  });
}
