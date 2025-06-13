import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterProviderScreen extends StatelessWidget {
  const RegisterProviderScreen({super.key});

  void _navigateToDeliveryRegistration(BuildContext context) {
    context.push('/delivery-registration');
  }

  void _navigateToCookingRegistration(BuildContext context) {
    context.push('/ResturantLawData');
  }

  void _navigateToSubscriptionRegistration(BuildContext context) {
    context.push('/subscription-registration');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'إختر نوع الخدمة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    _buildOptionBox(
                      context,
                      icon: Icons.directions_car,
                      label: 'تأجير السيارات',
                      color: Colors.blue,
                      onTap: () => _navigateToDeliveryRegistration(context),
                    ),
                    const SizedBox(width: 10),
                    _buildOptionBox(
                      context,
                      icon: Icons.kitchen,
                      label: 'المطعم',
                      color: Colors.orange,
                      onTap: () => _navigateToCookingRegistration(context),
                    ),
                    const SizedBox(width: 10),
                    _buildOptionBox(
                      context,
                      icon: Icons.home,
                      label: 'عقارات',
                      color: Colors.green,
                      onTap: () => _navigateToSubscriptionRegistration(context),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionBox(
      BuildContext context, {
        required IconData icon,
        required String label,
        required Color color,
        required VoidCallback onTap,
      }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
