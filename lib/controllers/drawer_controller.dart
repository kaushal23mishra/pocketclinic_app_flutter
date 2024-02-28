import 'package:get/get.dart';

// I haven't added a try-catch block here because I've already handled each aspect in the API services class.
// Controller for the main drawer
class MainDrawerController extends GetxController {
  // Observable to control drawer visibility
  final hideDrawer = true.obs;

  // Observable to track the current index of the drawer
  final currentIndex = 0.obs;

  // Observable to control the visibility of some element
  final isVisible = false.obs;

  @override
  void onInit() {
    // TODO: Implement any initialization logic here
    super.onInit();
  }
}

// Controller for the sub drawer
class SubDrawerController extends GetxController {
  // Observable to control drawer visibility
  final hideDrawer = true.obs;

  // Observable to track the current index of the drawer
  final currentIndex = 0.obs;

  // Observable to control the visibility of some element
  final isVisible = false.obs;

  @override
  void onInit() {
    // TODO: Implement any initialization logic here
    super.onInit();
  }
}

// Controller for the visit category
class VisitCategoryController extends GetxController {
  // Observable to control drawer visibility
  final hideDrawer = true.obs;

  // Observable to track the current index of the drawer
  final currentIndex = 0.obs;

  // Observable to control the visibility of some element
  final isVisible = false.obs;

  @override
  void onInit() {
    // TODO: Implement any initialization logic here
    super.onInit();
  }
}

// Controller for the your task category
class YourTaskCategoryController extends GetxController {
  // Observable to control drawer visibility
  final hideDrawer = true.obs;

  // Observable to track the current index of the drawer
  final currentIndex = 0.obs;

  // Observable to control the visibility of some element
  final isVisible = false.obs;

  @override
  void onInit() {
    // TODO: Implement any initialization logic here
    super.onInit();
  }
}
