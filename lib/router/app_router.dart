import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saba2v2/providers/auth_provider.dart';
import 'package:saba2v2/screens/auth/login_screen.dart';
import 'package:saba2v2/screens/auth/register_user_screen.dart';
import 'package:saba2v2/screens/auth/register_provider_screen.dart';
import 'package:saba2v2/screens/business/CarsScreens/delivery_homescreen.dart';
import 'package:saba2v2/screens/business/CarsScreens/delivery_person_inforamtion.dart';
import 'package:saba2v2/screens/business/CarsScreens/driver_car_info.dart';
import 'package:saba2v2/screens/business/RealStateScreens/AccountReviewing.dart';
import 'package:saba2v2/screens/business/Public/Notifcations.dart';
import 'package:saba2v2/screens/business/RealStateScreens/property_details_screen.dart';
import 'package:saba2v2/screens/business/ResturantScreens/ResturantHomeScreen.dart';
import 'package:saba2v2/screens/business/ResturantScreens/ResturantInformation.dart';
import 'package:saba2v2/screens/business/ResturantScreens/ResturantLawData.dart';
import 'package:saba2v2/screens/business/ResturantScreens/ResturantWorkeTime.dart';
import 'package:saba2v2/screens/business/RealStateScreens/SubscriptionRegistrationOfficeScreen.dart';
import 'package:saba2v2/screens/business/RealStateScreens/SubscriptionRegistrationSingleScreen.dart';
import 'package:saba2v2/screens/business/CarsScreens/delivery_registration_screen.dart';
import 'package:saba2v2/screens/business/cooking_registration_screen.dart';
import 'package:saba2v2/screens/business/RealStateScreens/realState.dart';
import 'package:saba2v2/screens/onboarding/onboarding_screen.dart';
import 'package:saba2v2/screens/business/RealStateScreens/AddNewStateScreen.dart';
import 'package:saba2v2/screens/business/RealStateScreens/RealStateHomeScreen.dart';
import 'package:saba2v2/screens/splash/splash_screen.dart';
import 'package:saba2v2/screens/auth/forgotPassword.dart';
import 'package:saba2v2/screens/user/user_home_screen.dart';
import 'package:saba2v2/screens/business/CarsScreens/delivery_office_information.dart';

class AppRouter {
  static GoRouter createRouter(AuthProvider authProvider) {
    return GoRouter(
      initialLocation: '/login',
      refreshListenable: authProvider,
      redirect: (context, state) {
        final loggedIn = authProvider.isLoggedIn;
        final loggingIn = state.subloc == '/login' || state.subloc == '/onboarding';

        if (!loggedIn &&
            state.subloc != '/login' &&
            state.subloc != '/register-user' &&
            state.subloc != '/register-provider' &&
            state.subloc != '/forgotPassword' &&
            state.subloc != '/onboarding' &&
            state.subloc != '/SplashScreen') {
          return '/login';
        }

        if (loggedIn && loggingIn) {
          return '/UserHomeScreen';
        }
        return null;
      },
      routes: [
      // **********************************************************************
      // *                          الشاشات العامة                            *
      // **********************************************************************
      GoRoute(
        path: "/SplashScreen",
        name: "SplashScreen",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // **********************************************************************
      // *                         شاشات المصادقة                            *
      // **********************************************************************
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/forgotPassword',
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/register-user',
        name: 'registerUser',
        builder: (context, state) => const RegisterUserScreen(),
      ),
      GoRoute(
        path: '/register-provider',
        name: 'registerProvider',
        builder: (context, state) => const RegisterProviderScreen(),
      ),

      // **********************************************************************
      // *                     شاشات التسجيل كمزود خدمة                      *
      // **********************************************************************
      GoRoute(
        path: '/cooking-registration',
        name: 'cookingRegistration',
        builder: (context, state) => const CookingRegistrationScreen(),
      ),
      GoRoute(
        path: '/delivery-registration',
        name: 'deliveryRegistration',
        builder: (context, state) => const DeliveryRegistrationScreen(),
      ),

      // **********************************************************************
      // *                     شاشات العقارات (Real Estate)                   *
      // **********************************************************************
      GoRoute(
        path: '/subscription-registration',
        name: 'subscriptionRegistration',
        builder: (context, state) => const Realstate(),
      ),
      GoRoute(
        path: '/SubscriptionRegistrationOfficeScreen',
        name: 'SubscriptionRegistrationOfficeScreen',
        builder: (context, state) => const SubscriptionRegistrationOfficeScreen(),
      ),
      GoRoute(
        path: '/SubscriptionRegistrationSingleScreen',
        name: 'SubscriptionRegistrationSingleScreen',
        builder: (context, state) => const SubscriptionRegistrationSingleScreen(),
      ),
      GoRoute(
        path: '/AddNewStateScreen',
        name: 'AddNewStateScreen',
        builder: (context, state) => const AddNewStateScreen(),
      ),
      GoRoute(
        path: '/RealStateHomeScreen',
        name: 'RealStateHomeScreen',
        builder: (context, state) => const RealStateHomeScreen(),
      ),
      GoRoute(
        path: '/propertyDetails/:id',
        name: 'propertyDetails',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          if (id == null) {
            return const Scaffold(
              body: Center(child: Text('خطأ: معرف العقار غير موجود')),
            );
          }
          return PropertyDetailsScreen(propertyId: id);
        },
      ),

      // **********************************************************************
      // *                     شاشات المطاعم (Restaurants)                    *
      // **********************************************************************
      GoRoute(
        path: '/ResturantLawData',
        name: 'ResturantLawData',
        builder: (context, state) => const ResturantLawData(),
      ),
      GoRoute(
        path: '/ResturantInformation',
        name: 'ResturantInformation',
        builder: (context, state) => ResturantInformation(
          legalData: state.extra as RestaurantLegalData,
        ),
      ),
      GoRoute(
        path: '/ResturantWorkTime',
        name: 'ResturantWorkTime',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ResturantWorkTime(
            legalData: data['legal_data'] as RestaurantLegalData,
            accountInfo: data['account_info'] as RestaurantAccountInfo,
          );
        },
      ),
      GoRoute(
        path: '/restaurant-home',
        name: 'restaurantHome',
        builder: (context, state) => const ResturantHomeScreen(),
      ),

      // **********************************************************************
      // *                     شاشات التوصيل (Delivery)                       *
      // **********************************************************************
      GoRoute(
        path: '/delivery-office-information',
        name: 'deliveryOfficeInformation',
        builder: (context, state) => const DeliveryOfficeInformation(),
      ),
      GoRoute(
        path: '/delivery-homescreen',
        name: 'deliveryHomescreen',
        builder: (context, state) => const DeliveryHomeScreen(),
      ),
      GoRoute(
        path: '/DeliveryPersonInformationScreen',
        name: 'DeliveryPersonInformationScreen',
        builder: (context, state) => DeliveryPersonInformationScreen(),
      ),
      GoRoute(
        path: '/DriverCarInfo',
        name: 'DriverCarInfo',
        builder: (context, state) => DriverCarInfo(),
      ),
      // **********************************************************************
      // *                        شاشات المستخدمين                           *
      // **********************************************************************
      GoRoute(
        path: '/UserHomeScreen',
        name: 'UserHomeScreen',
        builder: (context, state) => const UserHomeScreen(),
      ),

      // **********************************************************************
      // *                        شاشات إضافية                                *
      // **********************************************************************
      GoRoute(
        path: '/NotificationsScreen',
        name: 'NotificationsScreen',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: "/AccountReviewing",
        name: "AccountReviewing",
        builder: (context, state) => const AccountReviewing(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('خطأ: ${state.error}'),
      ),
    ),
  );
}}
