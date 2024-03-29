import 'package:clean_architecture_counter/features/counter/domain/entities/gateway/counter_gateway.dart';
import 'package:clean_architecture_counter/features/counter/domain/usecases/counter_use_case.dart';
import 'package:clean_architecture_counter/features/counter/infrastructure/driven_adapter/api/counter_api/remote_counter_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockApi extends Mock implements CounterGateway {}

class MockHttpClient extends Mock implements http.Client {}

class MockRemoteCounterApi extends Mock implements RemoteCounterApi {}

class MockCounterUseCase extends Mock implements CounterUseCase {}
