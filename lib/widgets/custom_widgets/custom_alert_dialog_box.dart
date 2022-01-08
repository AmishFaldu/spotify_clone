import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class CustomAlertDialogBox extends StatelessWidget {
  final String title;
  final String description;
  final List<String> actions;
  final List<void Function()> actionFunctions;

  const CustomAlertDialogBox({
    Key? key,
    required this.title,
    required this.description,
    required this.actions,
    required this.actionFunctions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.black),
      ),
      content: Text(
        description,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Colors.black),
      ),
      actions: [
        Center(
          child: CustomBouncingButton(
            child: ElevatedButton(
              child: Text(
                actions[0],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: .2,
                      color: Colors.black,
                    ),
              ),
              onPressed: actionFunctions[0],
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(200, 50),
                ),
                alignment: Alignment.center,
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: CustomBouncingButton(
            child: ElevatedButton(
              child: Text(
                actions[1],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: .2,
                      color: Colors.black,
                    ),
              ),
              onPressed: actionFunctions[1],
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  const Size(200, 50),
                ),
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
      insetPadding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      actionsPadding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
    );
  }
}
