import 'package:flutter/material.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 – Flutter UI Fundamentals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<_ExerciseItem> _exercises = [
    _ExerciseItem(
      title: 'Exercise 1 – Core Widgets Demo',
      icon: Icons.widgets_outlined,
      builder: (_) => const CoreWidgetsScreen(),
    ),
    _ExerciseItem(
      title: 'Exercise 2 – Input Controls Demo',
      icon: Icons.tune,
      builder: (_) => const InputControlsScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
      ),
      body: ListView.builder(
        itemCount: _exercises.length,
        itemBuilder: (context, index) {
          final item = _exercises[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              leading: Icon(
                item.icon,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(item.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: item.builder,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ExerciseItem {
  final String title;
  final IconData icon;
  final WidgetBuilder builder;

  _ExerciseItem({
    required this.title,
    required this.icon,
    required this.builder,
  });
}

class _ExerciseScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const _ExerciseScaffold({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}

class CoreWidgetsScreen extends StatelessWidget {
  const CoreWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ExerciseScaffold(
      title: 'Exercise 1 – Core Widgets',
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Core Widgets in Flutter',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Text, Image, Icon, Card and ListTile are the building '
                'blocks of almost every Flutter screen.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(width: 8),
              Icon(
                Icons.thumb_up,
                color: Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(
                Icons.image,
                size: 60,
                color: Colors.deepPurple,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('John Doe'),
                  subtitle: Text('Flutter Student'),
                  trailing: Icon(Icons.more_vert),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('john.doe@example.com'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputControlsScreen extends StatefulWidget {
  const InputControlsScreen({super.key});

  @override
  State<InputControlsScreen> createState() =>
      _InputControlsScreenState();
}

enum Fruit {
  apple,
  banana,
  mango,
}

class _InputControlsScreenState
    extends State<InputControlsScreen> {
  double _sliderValue = 50;
  bool _switchValue = true;
  Fruit? _selectedFruit = Fruit.apple;
  DateTime? _pickedDate;
  TimeOfDay? _pickedTime;

  Future<void> _pickDate() async {
    final result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (result != null) {
      setState(() {
        _pickedDate = result;
      });
    }
  }

  Future<void> _pickTime() async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (result != null) {
      setState(() {
        _pickedTime = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ExerciseScaffold(
      title: 'Exercise 2 – Input Controls',
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Slider value: ${_sliderValue.round()}',
          ),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            divisions: 20,
            label: _sliderValue.round().toString(),
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text(
              'Enable notifications',
            ),
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          const Divider(),
          const Text(
            'Favorite fruit:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          RadioListTile<Fruit>(
            title: const Text('Apple'),
            value: Fruit.apple,
            groupValue: _selectedFruit,
            onChanged: (value) {
              setState(() {
                _selectedFruit = value;
              });
            },
          ),
          RadioListTile<Fruit>(
            title: const Text('Banana'),
            value: Fruit.banana,
            groupValue: _selectedFruit,
            onChanged: (value) {
              setState(() {
                _selectedFruit = value;
              });
            },
          ),
          RadioListTile<Fruit>(
            title: const Text('Mango'),
            value: Fruit.mango,
            groupValue: _selectedFruit,
            onChanged: (value) {
              setState(() {
                _selectedFruit = value;
              });
            },
          ),
          const Divider(),
          const Text(
            'Pickers:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pickDate,
                  icon: const Icon(
                    Icons.calendar_today,
                  ),
                  label: Text(
                    _pickedDate == null
                        ? 'Pick date'
                        : '${_pickedDate!.year}-'
                        '${_pickedDate!.month}-'
                        '${_pickedDate!.day}',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pickTime,
                  icon: const Icon(
                    Icons.access_time,
                  ),
                  label: Text(
                    _pickedTime == null
                        ? 'Pick time'
                        : _pickedTime!.format(context),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}