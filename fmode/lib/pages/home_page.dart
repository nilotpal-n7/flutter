import 'package:flutter/material.dart';
import 'package:fmode/components/box.dart';
import 'package:fmode/components/button.dart';
import 'package:fmode/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Center(
            child: MyBox(
              color: Theme.of(context).colorScheme.primary,
              child: MyButton(
                color: Theme.of(context).colorScheme.secondary,
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
              ),
            ),
          ),
        );
      }
    );
  }
}
