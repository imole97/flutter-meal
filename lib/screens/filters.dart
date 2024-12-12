import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGluttenFree = false;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('your filters')),
      body: Column(
        children: [
          SwitchListTile(
            value: _isGluttenFree,
            onChanged: (isChecked) {
              setState(() {
                _isGluttenFree = isChecked;
              });
            },
            title: Text(
              "Glutten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'only include glutten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
