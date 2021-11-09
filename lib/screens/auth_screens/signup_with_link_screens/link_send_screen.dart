import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class LinkSendScreen extends StatelessWidget {
  const LinkSendScreen({Key? key}) : super(key: key);
  static const route = '/login-with-link-email-send-screen';

  Future<void> openEmailApp(BuildContext context) async {
    var result = await OpenMailApp.openMailApp();

    // If no mail apps found, show error
    if (!result.didOpen && !result.canOpen) {
      print("error");

      // iOS: if multiple mail apps found, show dialog to select.
      // There is no native intent/default app system in iOS so
      // you have to do it yourself.
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) {
          return MailAppPickerDialog(
            mailApps: result.options,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Check you email',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "We sent you an email with a link that will log you in.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomBouncingButton(
              child: ElevatedButton(
                child: Center(
                  child: Text(
                    "Open Email app",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(letterSpacing: .2, color: Colors.black),
                  ),
                ),
                onPressed: () async {
                  await openEmailApp(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                  alignment: Alignment.centerLeft,
                  splashFactory: NoSplash.splashFactory,
                  fixedSize: MaterialStateProperty.all(
                    const Size(180, 50),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
