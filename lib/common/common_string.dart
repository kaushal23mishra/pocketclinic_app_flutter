import 'common_image.dart';

class StringConstant {
  static const String isLoggedIn = 'isLoggedIn';
  static const String token = 'token';
  static const String email = 'email';

  static const int timeOutDuration = 30;

  static final List<String> customNavigationDrawerIconsList = [
    CommonImage.timelineFilled,
    CommonImage.windowHollow,
  ];
  static final List<String> customNavigationDrawerIconLabel = [
    'Timeline',
    'Categories',
  ];
  static final List<String> subNavigationDrawerIconsList = [
    CommonImage.conditionIcon,
    CommonImage.labsIcon,
    CommonImage.proceduresImage,
    CommonImage.allergiesImage,
    CommonImage.immunizationsImage,
    CommonImage.medicationsImage,
    CommonImage.vitalsImage,
  ];

  static final List<String> customSubNavigationDrawerIconLabel = [
    'Conditions',
    'Labs',
    'Procedures',
    'Allergies',
    'Immunizations',
    'Medications',
    'Vitals',
  ];

  static final List<String> visitsNavigationDrawerIconLabel = [
    'All Visits',
    'Outpatient',
    'Diagnostic Report',
    'Immunization',
    'Medication Request',
    'Document Reference',
    'Surgery',
  ];
  static final List<String> yourTaskNavigationDrawerIconLabel = [
    'All tasks',
    'Pending tasks',
    'Completed tasks',
  ];
}
