import 'package:flutter/material.dart';

abstract class BaseConnector {
  showLoading();

  hideLoading();

  showmessage(String message);
}

class BaseViewModel<T extends BaseConnector> extends ChangeNotifier {
  T? connector;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseConnector {
 late VM viewModel;
VM initMyViewModel();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel=initMyViewModel();
  }

  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showLoading() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          title: Center(child: CircularProgressIndicator()),
        ));
  }

  @override
  showmessage(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Okay")),
          ],
        );
      },
    );

  }
}
