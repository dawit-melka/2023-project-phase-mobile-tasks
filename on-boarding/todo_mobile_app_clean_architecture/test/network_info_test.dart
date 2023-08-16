import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
// import 'package:mockito/mockito.dart';
import 'package:todo_mobile_app_clean_architecture/core/network/network_info.dart';
import 'network_info_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<InternetConnectionChecker>()
])


void main() {
  group('isConnected', () {
  NetworkInfoImpl networkInfo;
  MockInternetConnectionChecker mockInternetConnectionChecker;
  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });
    test("Should forward the call to InternetConnectionChecker.hasConnection", 
    () async {
      // arrange
      final tHasConnectionFuture = Future.value(true);
      when(mockInternetConnectionChecker.hasConnection)
      .thenAnswer((_) => tHasConnectionFuture);

      // Act
      final result = networkInfo.isConnected;

      // Assert
      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    },);
  });
}
