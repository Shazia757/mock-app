import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_app/controller/user_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final UserController c = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: c.users.length,
          itemBuilder: (context, index) {
            final user = c.users[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: CircleAvatar(child: Text(user['name'][0])),
                title: Text(
                  user['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('@${user['username']}'),
                    Text(user['email']),
                    Text(user['phone']),
                  ],
                ),
                isThreeLine: true,
              ),
            );
          },
        );
      }),
    );
  }
}
