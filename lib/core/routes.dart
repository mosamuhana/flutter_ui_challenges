import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../src/pages/index.dart';
import '../src/apps/index.dart';
import 'models.dart';

final List<dynamic> pages = [
  /*

  MenuItem(
    title: "Animations",
    icon: FontAwesomeIcons.truckMoving,
    items: [
      SubMenuItem("Fancy Appbar Animation", FancyAppbarAnimationPage(), path: FancyAppbarAnimationPage.path),
      SubMenuItem("Hero Animation", HeroAnimationPage(), path: HeroAnimationPage.path),
      SubMenuItem("Bottom Reveal Animation", BottomRevealAnimationPage(), path: BottomRevealAnimationPage.path),
      SubMenuItem("Animated Bottom Bar", AnimatedBottomBarPage(), path: AnimatedBottomBarPage.path),
      SubMenuItem("Animated List One", AnimatedListOnePage(), path: AnimatedListOnePage.path),
    ],
  ),
  MenuItem(
    title: "Profile",
    icon: Icons.person,
    items: [
      SubMenuItem("Profile 1", Profile1Page(), path: Profile1Page.path),
      SubMenuItem("Profile 2", Profile2Page(), path: Profile2Page.path),
      SubMenuItem("Profile 3", Profile3Page(), path: Profile3Page.path),
      SubMenuItem("Profile 4", Profile4Page(), path: Profile4Page.path),
      SubMenuItem("Profile 5", Profile5Page(), path: Profile5Page.path),
      SubMenuItem("Profile 6", Profile6Page(), path: Profile6Page.path),
      SubMenuItem("Profile 7", Profile7Page(), path: Profile7Page.path),
      SubMenuItem("Profile 8", Profile8Page(), path: Profile8Page.path),
      SubMenuItem("Profile 9", Profile9Page(), path: Profile9Page.path),
    ],
  ),
  MenuItem(
    title: "Authentication",
    icon: Icons.lock,
    items: [
      /*
      */
      SubMenuItem("Auth 1", Auth1Page(), path: Auth1Page.path),
      SubMenuItem("Auth 2", Auth2Page(), path: Auth2Page.path),
      SubMenuItem("Auth 3", Auth3Page(), path: Auth3Page.path),
      SubMenuItem("Login 1", Login1Page(), path: Login1Page.path),
      SubMenuItem("Login 2", Login2Page(), path: Login2Page.path),
      SubMenuItem("Login 3", Login3Page(), path: Login3Page.path),
      SubMenuItem("Login 4", Login4Page(), path: Login4Page.path),
      SubMenuItem("Login 5", Login5Page(), path: Login5Page.path),
      SubMenuItem("Login 6", Login6Page(), path: Login6Page.path),
      SubMenuItem("Login 7", Login7Page(), path: Login7Page.path),
      SubMenuItem("Signup 1", Signup1Page(), path: Signup1Page.path),
      SubMenuItem("Signup 2", Signup2Page(), path: Signup2Page.path),
    ],
  ),
  MenuItem(
    title: "Settings",
    icon: Icons.dashboard,
    items: [
      SubMenuItem("Settings 1", Settings1Page(), path: Settings1Page.path),
      SubMenuItem("Settings 2", Settings2Page(), path: Settings2Page.path),
      SubMenuItem("Settings 3", Settings3Page(), path: Settings3Page.path),
    ],
  ),
  MenuItem(
    title: "Motorbike App",
    icon: Icons.list,
    items: [
      SubMenuItem("Home", BikeHomePage(), path: BikeHomePage.path),
      //SubMenuItem("Bike Details Page", BikeDetailsPage(), path: BikeDetailsPage.path),
    ],
  ),
  MenuItem(
    title: "Lists",
    icon: Icons.list,
    items: [
      SubMenuItem("List 1", List1Page(), path: List1Page.path),
      SubMenuItem("List 2", List2Page(), path: List2Page.path),
    ],
  ),
  MenuItem(
    title: "Invitation",
    icon: Icons.list,
    items: [
      SubMenuItem("Auth Page", InvitationAuthPage(), path: InvitationAuthPage.path),
      SubMenuItem("Landing Page", InvitationLandingPage(), path: InvitationLandingPage.path),
      SubMenuItem("Details Page", InvitationPage(), path: InvitationPage.path),
    ],
  ),
  MenuItem(
    title: "Ecommerce",
    icon: Icons.shopping_basket,
    items: [
      SubMenuItem("Cart 1", Cart1Page(), path: Cart1Page.path),
      SubMenuItem("Cart 2", Cart2Page(), path: Cart2Page.path),
      SubMenuItem("Checkout", CheckoutPage(), path: CheckoutPage.path),
      SubMenuItem("Confirm Order", ConfirmOrderPage(), path: ConfirmOrderPage.path),
      SubMenuItem("Ecommerce 1", Ecommerce1Page(), path: Ecommerce1Page.path),
      SubMenuItem("Ecommerce 2", Ecommerce2Page(), path: Ecommerce2Page.path),
      SubMenuItem("Ecommerce 3", Ecommerce3Page(), path: Ecommerce3Page.path),
      SubMenuItem("Ecommerce 4", Ecommerce4Page(), path: Ecommerce4Page.path),
      SubMenuItem("Ecommerce Details 1", EcommerceDetail1Page(), path: EcommerceDetail1Page.path),
      SubMenuItem("Ecommerce Details 2", EcommerceDetail2Page(), path: EcommerceDetail2Page.path),
      SubMenuItem("Ecommerce Details 3", EcommerceDetail3Page(), path: EcommerceDetail3Page.path),
    ],
  ),
  MenuItem(
    title: "Blog",
    icon: Icons.pages,
    items: [
      SubMenuItem("News Home", NewsHomePage(), path: NewsHomePage.path),
      SubMenuItem("Sports News Home", SportsNewsHomePage(), path: SportsNewsHomePage.path),
      SubMenuItem("Blog Home", BlogHomePage(), path: BlogHomePage.path),
      SubMenuItem("Article 1", Article1Page(), path: Article1Page.path),
      SubMenuItem("Article 2", Article2Page(), path: Article2Page.path),
    ],
  ),
  MenuItem(
    title: "Dashboard",
    icon: Icons.dashboard,
    items: [
      SubMenuItem("Dashboard 1", Dashboard1Page(), path: Dashboard1Page.path),
      SubMenuItem("Dashboard 2", Dashboard2Page(), path: Dashboard2Page.path),
      SubMenuItem("Dashboard 3", Dashboard3Page(), path: Dashboard3Page.path),
    ],
  ),
  MenuItem(
    title: "Food",
    icon: Icons.fastfood,
    items: [
      SubMenuItem("Food Order Checkout", FoodOrderCheckoutPage(), path: FoodOrderCheckoutPage.path),
      SubMenuItem("Fruits Add to Cart", AvocadoPage(), path: AvocadoPage.path),
      SubMenuItem("Cake Details", CakeDetailsPage(), path: CakeDetailsPage.path),
      SubMenuItem("Recipe List", RecipeListPage(), path: RecipeListPage.path),
      SubMenuItem("Food Delivery", FoodDeliveryPage(), path: FoodDeliveryPage.path),
    ],
  ),
  MenuItem(
    title: "Todo",
    icon: FontAwesomeIcons.tasks,
    items: [
      SubMenuItem("Todo Home 1", TodoHome1Page(), path: TodoHome1Page.path),
      SubMenuItem("Todo Home 2", TodoHome2Page(), path: TodoHome2Page.path),
      SubMenuItem("Todo Home 3", TodoHome3Page(), path: TodoHome3Page.path),
      SubMenuItem("Todo Home 4", TodoHome4Page(), path: TodoHome4Page.path),
    ],
  ),
  MenuItem(
    title: "Travel",
    icon: Icons.airplanemode_active,
    items: [
      SubMenuItem("Travel Home 1", TravelHome1Page(), path: TravelHome1Page.path),
      SubMenuItem("Travel Home 2", TravelHome2Page(), path: TravelHome2Page.path),
      SubMenuItem("Travel Nepal", TravelNepalPage(), path: TravelNepalPage.path),
      SubMenuItem("Travel Destination Detail", TravelDestinationDetailPage(), path: TravelDestinationDetailPage.path),
    ],
  ),
  MenuItem(
    title: "Navigation",
    icon: Icons.menu,
    items: [
      SubMenuItem("Menu One", MenuOnePage(), path: MenuOnePage.path),
      SubMenuItem("Hidden Menu", HiddenMenuPage(), path: HiddenMenuPage.path),
      SubMenuItem("Dark Drawer Menu", DarkDrawerMenuPage(), path: DarkDrawerMenuPage.path),
      SubMenuItem("Light Drawer Menu", LightDrawerMenuPage(), path: LightDrawerMenuPage.path),
      SubMenuItem("Fancy Bottom Navigation", FancyBottomNavigationPage(), path: FancyBottomNavigationPage.path),
    ],
  ),
  MenuItem(
    title: "Onboarding",
    icon: Icons.info,
    items: [
      SubMenuItem("Onboarding 1", Onboarding1Page(), path: Onboarding1Page.path),
      SubMenuItem("Onboarding 2", Onboarding2Page(), path: Onboarding2Page.path),
      SubMenuItem("Onboarding 3", Onboarding3Page(), path: Onboarding3Page.path),
      SubMenuItem("Onboarding 4", Onboarding4Page(), path: Onboarding4Page.path),
      SubMenuItem("Onboarding 5", Onboarding5Page(), path: Onboarding5Page.path),
      SubMenuItem("Onboarding 6", Onboarding6Page(), path: Onboarding6Page.path),
      SubMenuItem("Smart Wallet Onboarding", SmartWalletOnboardingPage(), path: SmartWalletOnboardingPage.path),
    ],
  ),
  */
  MenuItem(
    title: "Miscellaneous",
    items: [
      SubMenuItem('Image Crop', ImageCropPage(), path: ImageCropPage.path, icon: Icons.crop),
      SubMenuItem("Gallery One", GalleryOnePage(), path: GalleryOnePage.path),
      SubMenuItem('Music player One', MusicPlayerOnePage(), path: MusicPlayerOnePage.path),
      SubMenuItem("Music Player Two", MusicPlayerTwoPage(), path: MusicPlayerTwoPage.path),
      SubMenuItem("Image Popup", ImagePopupPage(), path: ImagePopupPage.path),
      SubMenuItem("Chat Messaages", ChatMessaagesPage(), path: ChatMessaagesPage.path),
      SubMenuItem("Form Elements", FormElementsPage(), path: FormElementsPage.path),
      SubMenuItem("Sliders", SlidersPage(), path: SlidersPage.path),
      SubMenuItem("Alert Dialogs", AlertDialogsPage(), path: AlertDialogsPage.path),
      SubMenuItem("Springy Slider", SpringySliderPage(), path: SpringySliderPage.path),
      SubMenuItem("Sliver App Bar", SliverAppBarPage(), path: SliverAppBarPage.path),
      SubMenuItem("Loaders", LoadersPage(), path: LoadersPage.path),
      SubMenuItem("ChatUi", ChatUiPage(), path: ChatUiPage.path),
      SubMenuItem('BottomSheet Awesome', BottomSheetAwesome(), path: BottomSheetAwesome.path),
    ],
  ),
  MenuItem(
    title: "Apps (Clones)",
    items: [
      //SubMenuItem("Hotel App", HotelHomePage(), path: HotelHomePage.path),
      //SubMenuItem("Quiz App", QuizHomePage(), path: QuizHomePage.path),
      //SubMenuItem("Grocery UI Kit", GroceryHomePage(), path: GroceryHomePage.path),
      SubMenuItem("Furniture App", FurnitureApp(), path: FurnitureApp.path),
      SubMenuItem('Khalti App', KhaltiApp(), path: KhaltiApp.path),
      SubMenuItem("Bank App Clone", NicAsiaApp(), path: NicAsiaApp.path),
    ],
    icon: Icons.account_balance_wallet,
  ),
];

SubMenuItem getItemForKey(String key) {
  SubMenuItem item;
  List<dynamic> _pages = List<dynamic>.from(pages);
  _pages.forEach((page) {
    if (page is SubMenuItem && page.title == key) {
      item = page;
    } else if (page is MenuItem) {
      page.items.forEach((sub) {
        if (sub.title == key) item = sub;
      });
    }
  });
  return item;
}
