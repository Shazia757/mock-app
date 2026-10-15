import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_app/controller/user_controller.dart';
import 'package:mock_app/view/user_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final UserController c = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 12),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'All Users',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF20243A),
                      ),
                    ),
                  ),
                  Text(
                    '${c.users.length} results',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            // User list
            Expanded(
              child: c.users.isEmpty
                  ? const Center(child: Text('No users found'))
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      itemCount: c.users.length,
                      itemBuilder: (context, index) {
                        final user = c.users[index];

                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 12),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.grey.shade200),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(18),
                            onTap: () =>Get.to(UserDetailsScreen(c.users[index])),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.indigo.shade50,
                                    child: Text(
                                      user['name'][0].toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo.shade700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user['name'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF20243A),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '@${user['username']}',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        const SizedBox(height: 14),
                                        Divider(
                                          height: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.mail_outline_rounded,
                                              size: 17,
                                              color: Colors.indigo.shade400,
                                            ),
                                            const SizedBox(width: 9),
                                            Expanded(
                                              child: Text(
                                                user['email'],
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF555B6E),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.phone_outlined,
                                              size: 17,
                                              color: Colors.indigo.shade400,
                                            ),
                                            const SizedBox(width: 9),
                                            Expanded(
                                              child: Text(
                                                user['phone'],
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF555B6E),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      }),
    );
  }
}
