import 'package:get/state_manager.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var users = [].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      error.value = '';

      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );

      if (response.statusCode == 200) {
        users.value = jsonDecode(response.body);
      } else {
        error.value = 'Failed to fetch users';
      }
    } catch (e) {
      error.value = 'Something went wrong';
    } finally {
      isLoading.value = false;
    }
  }
}
