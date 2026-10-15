import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final dynamic user;

  const UserDetailsScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          'User Details',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF20243A),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF20243A),
                    ),
                  ),
                  const SizedBox(height: 14),

                  _detailCard(
                    icon: Icons.email_outlined,
                    title: 'Email Address',
                    value: user['email'],
                  ),
                  _detailCard(
                    icon: Icons.phone_outlined,
                    title: 'Phone Number',
                    value: user['phone'],
                  ),
                  _detailCard(
                    icon: Icons.language_outlined,
                    title: 'Website',
                    value: user['website'],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF20243A),
                    ),
                  ),
                  const SizedBox(height: 14),

                  _detailCard(
                    icon: Icons.location_on_outlined,
                    title: 'Street',
                    value: user['address']['street'],
                  ),
                  _detailCard(
                    icon: Icons.location_city_outlined,
                    title: 'City',
                    value: user['address']['city'],
                  ),
                  _detailCard(
                    icon: Icons.markunread_mailbox_outlined,
                    title: 'ZIP Code',
                    value: user['address']['zipcode'],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Company Information',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF20243A),
                    ),
                  ),
                  const SizedBox(height: 14),

                  _detailCard(
                    icon: Icons.business_outlined,
                    title: 'Company Name',
                    value: user['company']['name'],
                  ),
                  _detailCard(
                    icon: Icons.work_outline,
                    title: 'Catchphrase',
                    value: user['company']['catchPhrase'],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.indigo.shade700, size: 21),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF20243A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
