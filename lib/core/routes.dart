import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../src/pages/animations/bottom_reveal_animation.page.dart';
import '../src/pages/animations/fancy_appbar_animation.page.dart';
import '../src/pages/animations/animated_bottom_bar.page.dart';
import '../src/pages/animations/animated_list_one.page.dart';
import '../src/pages/animations/hero_animation.page.dart';

import '../src/pages/profile/profile1.dart';
import '../src/pages/profile/profile2.dart';
import '../src/pages/profile/profile3.dart';
import '../src/pages/profile/profile4.dart';
import '../src/pages/profile/profile5.dart';
import '../src/pages/profile/profile6.dart';
import '../src/pages/profile/profile7.dart';
import '../src/pages/profile/profile8.dart';
import '../src/pages/profile/profile9.dart';

import '../src/pages/login/auth1.dart';
import '../src/pages/login/auth2.dart';
import '../src/pages/login/auth3.dart';
import '../src/pages/login/login1.dart';
import '../src/pages/login/login2.dart';
import '../src/pages/login/login3.dart';
import '../src/pages/login/login4.dart';
import '../src/pages/login/login5.dart';
import '../src/pages/login/login6.dart';
import '../src/pages/login/login7.dart';
import '../src/pages/login/signup1.dart';
import '../src/pages/login/signup2.dart';

import '../src/pages/settings/settings1.dart';
import '../src/pages/settings/settings2.dart';
import '../src/pages/settings/settings3.dart';

import '../src/pages/bike/bike_details.dart';
import '../src/pages/bike/home_page.dart';

import '../src/pages/lists/list1.dart';
import '../src/pages/lists/list2.dart';

import '../src/pages/invitation/inauth.dart';
import '../src/pages/invitation/inlanding.dart';
import '../src/pages/invitation/invitation1.dart';

import '../src/pages/ecommerce/cart1.dart';
import '../src/pages/ecommerce/cart2.dart';
import '../src/pages/ecommerce/checkout1.dart';
import '../src/pages/ecommerce/confirm_order1.dart';
import '../src/pages/ecommerce/ecommerce1.dart';
import '../src/pages/ecommerce/ecommerce2.dart';
import '../src/pages/ecommerce/ecommerce4.dart';
import '../src/pages/ecommerce/ecommerce5.dart';
import '../src/pages/ecommerce/ecommerce_detail1.dart';
import '../src/pages/ecommerce/ecommerce_detail2.dart';
import '../src/pages/ecommerce/ecommerce_detail3.dart';

import '../src/pages/blog/article1.dart';
import '../src/pages/blog/article2.dart';
import '../src/pages/blog/bhome1.dart';
import '../src/pages/blog/news1.dart';
import '../src/pages/blog/sports_news1.dart';

import '../src/pages/dashboard/dash1.dart';
import '../src/pages/dashboard/dash2.dart';
import '../src/pages/dashboard/dash3.dart';

import '../src/pages/food/avocado.dart';
import '../src/pages/food/cake_details.dart';
import '../src/pages/food/food_delivery.dart';
import '../src/pages/food/food_checkout.dart';
import '../src/pages/food/recipe_details.dart';
import '../src/pages/food/recipe_list.dart';
import '../src/pages/food/recipe_single.dart';

import '../src/pages/quiz_app/check_answers.dart';
import '../src/pages/quiz_app/models/demo_values.dart';
import '../src/pages/quiz_app/home.dart';
import '../src/pages/quiz_app/quiz_finished.dart';
import '../src/pages/quiz_app/quiz_page.dart';

import '../src/pages/todo/todo_home1/page.dart';
import '../src/pages/todo/todo_home2/page.dart';
import '../src/pages/todo/todo_home3/page.dart';
import '../src/pages/todo/todo_home4/page.dart';

import '../src/pages/travel/travel_home1/page.dart';
import '../src/pages/travel/travel_home2/page.dart';
import '../src/pages/travel/destination/page.dart';
import '../src/pages/travel/travel_nepal/page.dart';

import '../src/pages/hotel/details.dart';
import '../src/pages/hotel/home.dart';

import '../src/pages/navigation/dark_drawer_menu.dart';
import '../src/pages/navigation/light_drawer_menu.dart';
import '../src/pages/navigation/hidden_menu.dart';
import '../src/pages/navigation/menu_one.dart';
import '../src/pages/navigation/fancy_bottom_navigation/page.dart';

import '../src/pages/onboarding/onboarding1.dart';
import '../src/pages/onboarding/onboarding2.dart';
import '../src/pages/onboarding/onboarding3.dart';
import '../src/pages/onboarding/onboarding4.dart';
import '../src/pages/onboarding/onboarding5.dart';
import '../src/pages/onboarding/onboarding6.dart';
import '../src/pages/onboarding/smart_wallet_onboarding.dart';

import '../src/apps/khalti/main.dart';
import '../src/apps/grocery/ghome.dart';
import '../src/apps/nic_asia/nic_asia_app.dart';
import '../src/apps/furniture/furniture_app.dart';

import '../src/pages/dialogs/alert_dialogs/page.dart';

import '../src/pages/misc/bottom_sheet_awesome/page.dart';
import '../src/pages/misc/chat_messages/page.dart';
import '../src/pages/misc/chatui/page.dart';
import '../src/pages/misc/image_crop/page.dart';
import '../src/pages/misc/form_elements/page.dart';
import '../src/pages/misc/gallery_one/page.dart';
import '../src/pages/misc/image_popup/page.dart';
import '../src/pages/misc/loaders/page.dart';
import '../src/pages/misc/musicplayer_one/page.dart';
import '../src/pages/misc/musicplayer_two/page.dart';
import '../src/pages/misc/sliders/page.dart';
import '../src/pages/misc/sliver_app_bar/page.dart';
import '../src/pages/misc/springy_slider_page/page.dart';

import 'models.dart';

final List<dynamic> pages = [
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
      SubMenuItem("Profile One", ProfileOnePage(), path: ProfileOnePage.path),
      SubMenuItem("Profile Two", ProfileTwoPage(), path: ProfileTwoPage.path),
      SubMenuItem("Profile Three", ProfileThreePage(), path: ProfileThreePage.path),
      SubMenuItem("Profile Four", ProfileFourPage(), path: ProfileFourPage.path),
      SubMenuItem("Profile Five", ProfileFivePage(), path: ProfileFivePage.path),
      SubMenuItem("Profile Six", ProfileSixPage(), path: ProfileSixPage.path),
      SubMenuItem("Profile Seven", ProfileSevenPage(), path: ProfileSevenPage.path),
      SubMenuItem("Profile Eight", ProfileEightPage(), path: ProfileEightPage.path),
      SubMenuItem("Profile Nine", ProfileNinePage(), path: ProfileNinePage.path),
    ],
  ),
  MenuItem(
    title: "Authentication",
    icon: Icons.lock,
    items: [
      SubMenuItem("Auth One", AuthOnePage(), path: AuthOnePage.path),
      SubMenuItem("Auth Two", AuthTwoPage(), path: AuthTwoPage.path),
      SubMenuItem("Auth Three", AuthThreePage(), path: AuthThreePage.path),
      SubMenuItem("Login One", LoginOnePage(), path: LoginOnePage.path),
      SubMenuItem("Login Two", LoginTwoPage(), path: LoginTwoPage.path),
      SubMenuItem("Login Three", LoginThreePage(), path: LoginThreePage.path),
      SubMenuItem("Login Four", LoginFourPage(), path: LoginFourPage.path),
      SubMenuItem("Login Five", LoginFivePage(), path: LoginFivePage.path),
      SubMenuItem("Login Six", LoginSixPage(), path: LoginSixPage.path),
      SubMenuItem("Login Seven", LoginSevenPage(), path: LoginSevenPage.path),
      SubMenuItem("Signup One", SignupOnePage(), path: SignupOnePage.path),
      SubMenuItem("Signup Two", SignupTwoPage(), path: SignupTwoPage.path),
    ],
  ),
  MenuItem(
    title: "Settings",
    icon: Icons.dashboard,
    items: [
      SubMenuItem("Settings One", SettingsOnePage(), path: SettingsOnePage.path),
      SubMenuItem("Settings Two", SettingsTwoPage(), path: SettingsTwoPage.path),
      SubMenuItem("Settings Three", SettingsThreePage(), path: SettingsThreePage.path),
    ],
  ),
  MenuItem(
    title: "Motorbike App",
    icon: Icons.list,
    items: [
      SubMenuItem("Home Page", BikeHomePage(), path: BikeHomePage.path),
      SubMenuItem("Bike Details Page", BikeDetailsPage(), path: BikeDetailsPage.path),
    ],
  ),
  MenuItem(
    title: "Lists",
    icon: Icons.list,
    items: [
      SubMenuItem("Places List One", PlaceList1(), path: PlaceList1.path),
      SubMenuItem("List Two", SchoolList(), path: SchoolList.path),
    ],
  ),
  MenuItem(
    title: "Invitation",
    icon: Icons.list,
    items: [
      SubMenuItem("Auth Page", InvitationAuthPage(), path: InvitationAuthPage.path),
      SubMenuItem("Landing Page", InvitationLandingPage(), path: InvitationLandingPage.path),
      SubMenuItem("Details Page", InvitationPageOne(), path: InvitationPageOne.path),
    ],
  ),
  MenuItem(
    title: "Ecommerce",
    icon: Icons.shopping_basket,
    items: [
      SubMenuItem("Cart One", CartOnePage(), path: CartOnePage.path),
      SubMenuItem("Cart Two", CartTwoPage(), path: CartTwoPage.path),
      SubMenuItem("Checkout One", CheckoutOnePage(), path: CheckoutOnePage.path),
      SubMenuItem("Confirm Order", ConfirmOrderPage(), path: ConfirmOrderPage.path),
      SubMenuItem("Rounded Details Page", EcommerceDetailThreePage(), path: EcommerceDetailThreePage.path),
      SubMenuItem("Ecommerce One", EcommerceOnePage(), path: EcommerceOnePage.path),
      SubMenuItem("Ecommerce Two", EcommerceTwoPage(), path: EcommerceTwoPage.path),
      SubMenuItem("Ecommerce Four", EcommerceFourPage(), path: EcommerceFourPage.path),
      SubMenuItem("Ecommerce Grocery", EcommerceFivePage(), path: EcommerceFivePage.path),
      SubMenuItem("Ecommerce Details One", EcommerceDetailOnePage(), path: EcommerceDetailOnePage.path),
      SubMenuItem("Ecommerce Details Two", EcommerceDetailTwoPage(), path: EcommerceDetailTwoPage.path),
    ],
  ),
  MenuItem(
    title: "Blog",
    icon: Icons.pages,
    items: [
      SubMenuItem("News Home", NewsHomeOnePage(), path: NewsHomeOnePage.path),
      SubMenuItem("Sports News Home", SportsNewsOnePage(), path: SportsNewsOnePage.path),
      SubMenuItem("Blog Home One", BlogHomeOnePage(), path: BlogHomeOnePage.path),
      SubMenuItem("Article One", ArticleOnePage(), path: ArticleOnePage.path),
      SubMenuItem("Article Two", ArticleTwoPage(), path: ArticleTwoPage.path),
    ],
  ),
  MenuItem(
    title: "Dashboard",
    icon: Icons.dashboard,
    items: [
      SubMenuItem("Dashboard One", DashboardOnePage(), path: DashboardOnePage.path),
      SubMenuItem("Dashboard Two", DashboardTwoPage(), path: DashboardTwoPage.path),
      SubMenuItem("Dashboard Three", DashboardThreePage(), path: DashboardThreePage.path),
    ],
  ),
  MenuItem(
    title: "Food",
    icon: Icons.fastfood,
    items: [
      SubMenuItem("Food Order Checkout", FoodCheckoutOnePage(), path: FoodCheckoutOnePage.path),
      SubMenuItem("Fruits Add to Cart", AvocadoPage(), path: AvocadoPage.path),
      SubMenuItem("Cake Details", CakeDetailsPage(), path: CakeDetailsPage.path),
      SubMenuItem("Recipe List", RecipeListPage(), path: RecipeListPage.path),
      SubMenuItem("Recipe Single", RecipeSinglePage(), path: RecipeSinglePage.path),
      SubMenuItem("Recipe Details", RecipeDetailsPage(), path: RecipeDetailsPage.path),
      SubMenuItem("Food Delivery", FoodDeliveryHomePage(), path: FoodDeliveryHomePage.path),
    ],
  ),
  MenuItem(
    title: "Quiz app",
    icon: FontAwesomeIcons.question,
    items: [
      SubMenuItem("Quiz Home", QuizHomePage(), path: QuizHomePage.path),
      SubMenuItem("Quiz Page", QuizPage(questions: demoQuestions, category: categories[9]), path: QuizPage.path),
      SubMenuItem("Quiz Result", QuizFinishedPage(questions: demoQuestions, answers: demoAnswers),
          path: QuizFinishedPage.path),
      SubMenuItem("Check Answers", CheckAnswersPage(questions: demoQuestions, answers: demoAnswers),
          path: CheckAnswersPage.path),
    ],
  ),
  MenuItem(
    title: "Todo",
    icon: FontAwesomeIcons.tasks,
    items: [
      SubMenuItem("Todo Home 1", TodoHome1Page(), path: TodoHome1Page.path),
      SubMenuItem("Todo Home 2", TodoHome2Page(), path: TodoHome2Page.path),
      SubMenuItem("Todo Home 3", TodoHome3Page(), path: TodoHome3Page.path),
      // ***********************************
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
      SubMenuItem("Travel Destination Detail", DestinationPage(), path: DestinationPage.path),
    ],
  ),
  MenuItem(
    title: "Hotel",
    icon: Icons.hotel,
    items: [
      SubMenuItem("Hotel Home", HotelHomePage(), path: HotelHomePage.path),
      SubMenuItem("Room Details", HotelDetailsPage(), path: HotelDetailsPage.path),
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
  MenuItem(
    title: "Miscellaneous",
    items: [
      // ................
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
      SubMenuItem('Khalti App', KhaltiApp(), path: KhaltiApp.path),
      SubMenuItem("Grocery UI Kit", GroceryHomePage(), path: GroceryHomePage.path),
      SubMenuItem("Bank App Clone", NicAsiaApp(), path: NicAsiaApp.path),
      SubMenuItem("Furniture App", FurnitureApp(), path: FurnitureApp.path),
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
