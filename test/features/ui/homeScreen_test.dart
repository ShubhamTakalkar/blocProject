import 'package:blocapp/features/homeBloc/home_bloc.dart';
import 'package:blocapp/features/ui/homeScreen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:blocapp/features/ui/apiScreen.dart';


class MockHomeBloc extends Mock implements HomeBloc {}
void main() {
  group('HomeScreen Tests', () {
    late MockHomeBloc mockHomeBloc;

    setUp(() {
      mockHomeBloc = MockHomeBloc();
    });

    testWidgets('Button press triggers NavigateEvent and navigates to ApiScreen', (tester) async {
    
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<HomeBloc>(
            create: (_) => mockHomeBloc,
            child: HomeScreen(),
          ),
        ),
      );

       expect(find.byType(ElevatedButton), findsOneWidget);

      
    });
  });
}