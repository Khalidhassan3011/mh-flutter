part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;

  static const loginRegisterHints = _Paths.loginRegisterHints;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const registerEmployeeStep2 = _Paths.registerEmployeeStep2;
  static const registerEmployeeStep3 = _Paths.registerEmployeeStep3;
  static const registerEmployeeStep4 = _Paths.registerEmployeeStep4;
  static const registerLastStep = _Paths.registerLastStep;

  static const adminHome = _Paths.adminHome;
  static const adminAllClients = _Paths.adminAllClients;
  static const adminAllEmployees = _Paths.adminAllEmployees;

  static const employeeHome = _Paths.employeeHome;
  static const employeeDashboard = _Paths.employeeDashboard;

  static const clientHome = _Paths.clientHome;
  static const clientMyEmployee = _Paths.clientMyEmployee;
  static const clientDashboard = _Paths.clientDashboard;
  static const clientPaymentAndInvoice = _Paths.clientPaymentAndInvoice;
  static const clientShortlisted = _Paths.clientShortlisted;

  static const mhEmployees = _Paths.mhEmployees;
  static const employeeDetails = _Paths.employeeDetails;
  static const employeeRegisterSuccess = _Paths.employeeRegisterSuccess;
  static const termsAndCondition = _Paths.termsAndCondition;
  static const blockUser = _Paths.blockUser;
  static const mhEmployeesById = _Paths.mhEmployeesById;
  static const clientTermsConditionForHire = _Paths.clientTermsConditionForHire;
  static const payment = _Paths.paymentForHire;
  static const hireStatus = _Paths.hireStatus;
  static const clientNotification = _Paths.clientNotification;
  static const contactUs = _Paths.contactUs;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';

  static const loginRegisterHints = '/login-register-hints';
  static const login = '/login';
  static const register = '/register';
  static const registerEmployeeStep2 = '/register-employee-step-2';
  static const registerEmployeeStep3 = '/register-employee-step-3';
  static const registerEmployeeStep4 = '/register-employee-step-4';
  static const registerLastStep = '/register-last-step';

  static const adminHome = '/admin-home';
  static const adminAllClients = '/admin-all-clients';
  static const adminAllEmployees = '/admin-all-employees';

  static const employeeRegisterSuccess = '/employee-register-success';
  static const employeeHome = '/employee-home';
  static const employeeDashboard = '/employee-dashboard';

  static const clientHome = '/client-home';
  static const clientMyEmployee = '/client-my-employee';
  static const clientDashboard = '/client-dashboard';
  static const clientPaymentAndInvoice = '/client-payment-and-invoice';
  static const clientShortlisted = '/client-shortlisted';
  static const clientTermsConditionForHire = '/client-terms-condition-for-hire';
  static const paymentForHire = '/payment-for-hire';
  static const hireStatus = '/hire-status';
  static const clientNotification = '/client-notification';

  static const mhEmployees = '/mh-employees';
  static const employeeDetails = '/employee-details';

  static const termsAndCondition = '/terms-and-condition';
  static const blockUser = '/block-user';
  static const mhEmployeesById = '/mh-employees-by-id';

  static const contactUs = '/contact-us';
}
