import 'package:flutter/material.dart';
import 'package:meals_app/Screens/mainDrawer.dart';
import 'package:meals_app/Screens/tabs.dart';


class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(onSelectedScreen: ((identefier) {
      //   Navigator.of(context).pop();
      //   if (identefier == 'meals') {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   } else {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
      //   }
      // })),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFree,
            onChanged:(isChecked){
              setState(() {
                _glutenFree = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
