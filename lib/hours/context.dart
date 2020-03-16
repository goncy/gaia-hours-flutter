import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../session/models.dart';

import './models.dart';
import './resource.dart';

/// Hours context
class HoursContext extends ChangeNotifier {
  /// User
  final User user;

  /// Resource
  final HoursResource _resource = HoursResource();

  /// Status
  bool isLoading = false;

  /// Hours list
  List<Registry> registries = [];

  /// Constructor
  HoursContext(this.user) {
    list();
  }

  /// Fetch hours
  Future list() async {
    try {
      isLoading = true;

      notifyListeners();

      registries = await _resource.list();
      isLoading = false;

      notifyListeners();
    } on Exception catch (exception) {
      print(exception);
    }
  }

  /// Add registries
  Future add(int hours, int project, int category) async {
    isLoading = true;

    notifyListeners();

    registries.add(await _resource.add(user.id, hours, project, category));
    isLoading = false;

    notifyListeners();
  }
}

/// Hours provider
class HoursProvider extends StatelessWidget {
  /// Child widget
  final Widget child;

  /// Active user
  final User user;

  /// Constructor
  HoursProvider({Key key, @required this.child, @required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => HoursContext(user),
        child: child,
      );
}
