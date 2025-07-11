import 'package:go_router/go_router.dart';
import 'package:hjulfix_new/core/routes/routes_arguments.dart';
import 'package:hjulfix_new/core/shared/widgets/image_viewer.dart';
import 'package:hjulfix_new/features/shared/auth/views/login_view.dart';
import 'package:hjulfix_new/features/shared/welcome/views/welcome_view.dart';

import '../../features/admin/bottom_nav/views/bottom_nav_view.dart';
import '../../features/admin/customer_vehicles/views/vehicle_details_view.dart';
import '../../features/admin/offers/views/create_contact_view.dart';
import '../../features/admin/offers/views/create_offer_view.dart';
import '../../features/admin/offers/views/select_contact_view.dart';
import '../../features/admin/offers/views/select_products_view.dart';
import 'route_paths.dart';
import 'routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.welcome,
  routes: [
    GoRoute(
      path: RoutePaths.welcome,
      name: Routes.welcome,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      path: RoutePaths.login,
      name: Routes.login,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: RoutePaths.adminBottomNav,
      name: Routes.adminBottomNav,
      builder: (context, state) => BottomNavView(),
    ),
    GoRoute(
      path: RoutePaths.vehicleDetailsView,
      name: Routes.vehicleDetailsView,
      builder: (context, state) => VehicleDetailsView(),
    ),
    GoRoute(
      path: RoutePaths.imageViewer,
      name: Routes.imageViewer,
      builder: (context, state) {
        final details = state.extra as ImageViewerArgs;
        return ImageViewer(
          imageUrl: details.imageUrl,
          isNetwork: details.isNetworkImage ?? true,
        );
      },
    ),
    GoRoute(
      path: RoutePaths.createOfferView,
      name: Routes.createOfferView,
      builder: (context, state) => CreateOfferView(),
    ),
    GoRoute(
      path: RoutePaths.selectContactView,
      name: Routes.selectContactView,
      builder: (context, state) => SelectContactView(),
    ),
    GoRoute(
      path: RoutePaths.selectProductView,
      name: Routes.selectProductView,
      builder: (context, state) => SelectProductView(),
    ),
    GoRoute(
      path: RoutePaths.createContactView,
      name: Routes.createContactView,
      builder: (context, state) => CreateContactView(),
    ),
  ],
);