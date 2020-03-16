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

  HoursContext(this.user) {
    list();
  }

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

class HoursProvider extends StatelessWidget {
  final Widget child;
  final User user;

  HoursProvider({Key key, @required this.child, @required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => HoursContext(user),
        child: child,
      );
}
