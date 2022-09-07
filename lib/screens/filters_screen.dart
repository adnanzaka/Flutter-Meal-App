import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String titleText,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(titleText),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yours Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilter(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            _buildSwitchListTile(
              'Gluten-free',
              'Only include gluten-free meals',
              _glutenFree,
              (newvalue) {
                setState(
                  () {
                    _glutenFree = newvalue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Lactose-free',
              'Only include lactose-free meals',
              _lactoseFree,
              (newvalue) {
                setState(
                  () {
                    _lactoseFree = newvalue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegetarian',
              'Only include vagetarian meals',
              _vegetarian,
              (newvalue) {
                setState(
                  () {
                    _vegetarian = newvalue;
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegan',
              'Only include vagen meals',
              _vegan,
              (newvalue) {
                setState(
                  () {
                    _vegan = newvalue;
                  },
                );
              },
            ),
          ],
        ))
      ]),
    );
  }
}
