import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/admin/admin_all_clients/bindings/admin_all_clients_binding.dart';
import '../modules/admin/admin_all_clients/views/admin_all_clients_view.dart';
import '../modules/admin/admin_all_employees/bindings/admin_all_employees_binding.dart';
import '../modules/admin/admin_all_employees/views/admin_all_employees_view.dart';
import '../modules/admin/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin/admin_home/views/admin_home_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/login_register_hints/bindings/login_register_hints_binding.dart';
import '../modules/auth/login_register_hints/views/login_register_hints_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/steps/register_employee_step_2/bindings/register_employee_step_2_binding.dart';
import '../modules/auth/register/steps/register_employee_step_2/views/register_employee_step_2_view.dart';
import '../modules/auth/register/steps/register_employee_step_3/bindings/register_employee_step_3_binding.dart';
import '../modules/auth/register/steps/register_employee_step_3/views/register_employee_step_3_view.dart';
import '../modules/auth/register/steps/register_employee_step_4/bindings/register_employee_step_4_binding.dart';
import '../modules/auth/register/steps/register_employee_step_4/views/register_employee_step_4_view.dart';
import '../modules/auth/register/steps/register_last_step/bindings/register_last_step_binding.dart';
import '../modules/auth/register/steps/register_last_step/views/register_last_step_view.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/block_user/bindings/block_user_binding.dart';
import '../modules/block_user/views/block_user_view.dart';
import '../modules/client/client_dashboard/bindings/client_dashboard_binding.dart';
import '../modules/client/client_dashboard/views/client_dashboard_view.dart';
import '../modules/client/client_home/bindings/client_home_binding.dart';
import '../modules/client/client_home/views/client_home_view.dart';
import '../modules/client/client_my_employee/bindings/client_my_employee_binding.dart';
import '../modules/client/client_my_employee/views/client_my_employee_view.dart';
import '../modules/client/client_notification/bindings/client_notification_binding.dart';
import '../modules/client/client_notification/views/client_notification_view.dart';
import '../modules/client/client_payment_and_invoice/bindings/client_payment_and_invoice_binding.dart';
import '../modules/client/client_payment_and_invoice/views/client_payment_and_invoice_view.dart';
import '../modules/client/client_shortlisted/bindings/client_shortlisted_binding.dart';
import '../modules/client/client_shortlisted/views/client_shortlisted_view.dart';
import '../modules/client/client_terms_condition_for_hire/bindings/client_terms_condition_for_hire_binding.dart';
import '../modules/client/client_terms_condition_for_hire/views/client_terms_condition_for_hire_view.dart';
import '../modules/client/employee_details/bindings/employee_details_binding.dart';
import '../modules/client/employee_details/views/employee_details_view.dart';
import '../modules/client/hire_status/bindings/hire_status_binding.dart';
import '../modules/client/hire_status/views/hire_status_view.dart';
import '../modules/client/mh_employees/bindings/mh_employees_binding.dart';
import '../modules/client/mh_employees/views/mh_employees_view.dart';
import '../modules/client/mh_employees_by_id/bindings/mh_employees_by_id_binding.dart';
import '../modules/client/mh_employees_by_id/views/mh_employees_by_id_view.dart';
import '../modules/client/payment_for_hire/bindings/payment_for_binding.dart';
import '../modules/client/payment_for_hire/views/payment_for_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/employee/employee_dashboard/bindings/employee_dashboard_binding.dart';
import '../modules/employee/employee_dashboard/views/employee_dashboard_view.dart';
import '../modules/employee/employee_home/bindings/employee_home_binding.dart';
import '../modules/employee/employee_home/views/employee_home_view.dart';
import '../modules/employee/employee_register_success/bindings/employee_register_success_binding.dart';
import '../modules/employee/employee_register_success/views/employee_register_success_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/terms_and_condition/bindings/terms_and_condition_binding.dart';
import '../modules/terms_and_condition/views/terms_and_condition_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const splash = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.loginRegisterHints,
      page: () => const LoginRegisterHintsView(),
      binding: LoginRegisterHintsBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.registerEmployeeStep2,
      page: () => const RegisterEmployeeStep2View(),
      binding: RegisterEmployeeStep2Binding(),
    ),
    GetPage(
      name: _Paths.registerEmployeeStep3,
      page: () => const RegisterEmployeeStep3View(),
      binding: RegisterEmployeeStep3Binding(),
    ),
    GetPage(
      name: _Paths.registerEmployeeStep4,
      page: () => const RegisterEmployeeStep4View(),
      binding: RegisterEmployeeStep4Binding(),
    ),
    GetPage(
      name: _Paths.registerLastStep,
      page: () => const RegisterLastStepView(),
      binding: RegisterLastStepBinding(),
    ),
    GetPage(
      name: _Paths.adminHome,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.adminAllClients,
      page: () => const AdminAllClientsView(),
      binding: AdminAllClientsBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.adminAllEmployees,
      page: () => const AdminAllEmployeesView(),
      binding: AdminAllEmployeesBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.employeeHome,
      page: () => const EmployeeHomeView(),
      binding: EmployeeHomeBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.employeeDashboard,
      page: () => const EmployeeDashboardView(),
      binding: EmployeeDashboardBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.clientHome,
      page: () => const ClientHomeView(),
      binding: ClientHomeBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.clientMyEmployee,
      page: () => const ClientMyEmployeeView(),
      binding: ClientMyEmployeeBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.clientDashboard,
      page: () => const ClientDashboardView(),
      binding: ClientDashboardBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.clientPaymentAndInvoice,
      page: () => const ClientPaymentAndInvoiceView(),
      binding: ClientPaymentAndInvoiceBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.clientShortlisted,
      page: () => const ClientShortlistedView(),
      binding: ClientShortlistedBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.clientTermsConditionForHire,
      page: () => const ClientTermsConditionForHireView(),
      binding: ClientTermsConditionForHireBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.clientNotification,
      page: () => const ClientNotificationView(),
      binding: ClientNotificationBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.paymentForHire,
      page: () => const PaymentForHireView(),
      binding: PaymentForHireBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.hireStatus,
      page: () => const HireStatusView(),
      binding: HireStatusBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.mhEmployees,
      page: () => const MhEmployeesView(),
      binding: MhEmployeesBinding(),
    ),
    GetPage(
      name: _Paths.mhEmployeesById,
      page: () => const MhEmployeesByIdView(),
      binding: MhEmployeesByIdBinding(),
    ),
    GetPage(
      name: _Paths.employeeDetails,
      page: () => const EmployeeDetailsView(),
      binding: EmployeeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.employeeRegisterSuccess,
      page: () => const EmployeeRegisterSuccessView(),
      binding: EmployeeRegisterSuccessBinding(),
    ),
    GetPage(
      name: _Paths.termsAndCondition,
      page: () => const TermsAndConditionView(),
      binding: TermsAndConditionBinding(),
    ),
    GetPage(
      name: _Paths.blockUser,
      page: () => const BlockUserView(),
      binding: BlockUserBinding(),
    ),
    GetPage(
      name: _Paths.contactUs,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
  ];
}
