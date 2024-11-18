import 'package:blocapp/features/model/posts_model.dart';
import 'package:blocapp/features/repo/post_repo.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'dart:developer';

// Create a Mock class for http.Client using mocktail
class MockClient extends Mock implements http.Client {}

void main() {
  group('PostsRepo', () {
    late MockClient mockClient;

    // This will run before each test
    setUp(() {
      mockClient = MockClient();
    });

    test('apiCall test', () async {
      // Arrange: mock the HTTP response
      final mockResponse = jsonEncode([
       {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  },
      ]);

      // Use mocktail's when method to mock the client’s get method
      when(() => mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      // Act: call the fetchPosts method
      List<PostDataUiModel> posts = await PostsRepo.fetchPosts();

      // Assert: check if the posts list is not empty and contains the correct data
      expect(posts, isNotEmpty);
      expect(posts.length, 100);
      expect(posts[0].id, 1);
      expect(posts[0].userId, 1);
    });

    // test('fetchPosts returns an empty list when the server responds with an error', () async {
    //   // Arrange: simulate a failed response (e.g., server error)
    //   when(() => mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
    //       .thenAnswer((_) async => http.Response('Server error', 500));

    //   // Act: call the fetchPosts method
    //   List<PostDataUiModel> posts = await PostsRepo.fetchPosts();

    //   // Assert: check if the result is an empty list
    //   expect(posts, isEmpty);
    // });

    // test('fetchPosts handles malformed JSON response gracefully', () async {
    //   // Arrange: simulate a malformed JSON response
    //   when(() => mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
    //       .thenAnswer((_) async => http.Response('Invalid JSON', 200));

    //   // Act: call the fetchPosts method
    //   List<PostDataUiModel> posts = await PostsRepo.fetchPosts();

    //   // Assert: check if the result is an empty list due to the error
    //   expect(posts, isEmpty);
    // });

    // test('fetchPosts logs an error if the request fails', () async {
    //   // Arrange: simulate an exception being thrown
    //   when(() => mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
    //       .thenThrow(Exception('Network error'));

    //   // Act: call the fetchPosts method
    //   List<PostDataUiModel> posts = await PostsRepo.fetchPosts();

    //   // Assert: check if an empty list is returned due to the exception
    //   expect(posts, isEmpty);

    //   // Optionally: You can also verify if the log method was called if you want to test the log output.
    // });
  
  });
}