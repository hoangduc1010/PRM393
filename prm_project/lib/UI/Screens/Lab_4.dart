import 'package:flutter/material.dart';

void main() {
  runApp(const Lab4App());
}



class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 - Flutter UI Fundamentals',

      // Exercise 5: ThemeData
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xfff8f5fc),
        cardTheme: const CardThemeData(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ),

      home: const HomeScreen(),
    );
  }
}



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          ExerciseTile(
            title: 'Exercise 1 – Core Widgets',
            subtitle: 'Text, Image, Icon, Card, ListTile',
            page: const CoreWidgetsPage(),
          ),

          ExerciseTile(
            title: 'Exercise 2 – Input Controls',
            subtitle: 'Slider, Switch, RadioListTile, Pickers',
            page: const InputControlsPage(),
          ),

          ExerciseTile(
            title: 'Exercise 3 – Layout Demo',
            subtitle: 'Column, Row, Padding, ListView',
            page: const LayoutDemoPage(),
          ),

          ExerciseTile(
            title: 'Exercise 4 – App Structure & Theme',
            subtitle: 'Building screen structure using Scaffold',
            page: const AppStructurePage(),
          ),

          ExerciseTile(
            title: 'Exercise 5 – Common UI Fixes',
            subtitle: 'ThemeData and common UI errors',
            page: const CommonFixesPage(),
          ),
        ],
      ),
    );
  }
}

// Reusable ListTile for the home screen.
class ExerciseTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget page;

  const ExerciseTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle),
        ),

        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
          );
        },
      ),
    );
  }
}



class CoreWidgetsPage extends StatelessWidget {
  const CoreWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          // Text widget
          const Text(
            'Flutter Core Widgets',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Image widget
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://picsum.photos/600/250',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,

              // Display an icon if image cannot load.
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.image,
                    size: 80,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Icon widget
          const Row(
            children: [
              Icon(
                Icons.flutter_dash,
                size: 40,
              ),

              SizedBox(width: 12),

              Text(
                'Flutter UI Example',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Card widget
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),

              title: const Text(
                'Student Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: const Text(
                'Flutter UI Fundamentals',
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),

              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Student Profile selected'),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Another Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Core Widgets',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This exercise demonstrates Text, Image, '
                        'Icon, Card and ListTile widgets.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class InputControlsPage extends StatefulWidget {
  const InputControlsPage({super.key});

  @override
  State<InputControlsPage> createState() => _InputControlsPageState();
}

class _InputControlsPageState extends State<InputControlsPage> {
  double volume = 50;

  bool notifications = true;

  String selectedOption = 'Flutter';

  DateTime? selectedDate;

  TimeOfDay? selectedTime;

  // Show Date Picker.
  Future<void> chooseDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  // Show Time Picker.
  Future<void> chooseTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [


          const Text(
            '1. Slider',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Volume: ${volume.round()}',
          ),

          Slider(
            value: volume,
            min: 0,
            max: 100,
            divisions: 10,

            label: volume.round().toString(),

            onChanged: (value) {
              setState(() {
                volume = value;
              });
            },
          ),

          const Divider(),



          const Text(
            '2. Switch',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: Text(
              notifications
                  ? 'Notifications are ON'
                  : 'Notifications are OFF',
            ),

            value: notifications,

            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),

          const Divider(),



          const Text(
            '3. RadioListTile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          RadioListTile<String>(
            title: const Text('Flutter'),
            value: 'Flutter',
            groupValue: selectedOption,

            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),

          RadioListTile<String>(
            title: const Text('Android'),
            value: 'Android',
            groupValue: selectedOption,

            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),

          RadioListTile<String>(
            title: const Text('iOS'),
            value: 'iOS',
            groupValue: selectedOption,

            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),

          Text(
            'Selected: $selectedOption',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const Divider(),



          const Text(
            '4. Date Picker',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          ElevatedButton.icon(
            onPressed: chooseDate,
            icon: const Icon(Icons.calendar_month),
            label: const Text('Choose Date'),
          ),

          if (selectedDate != null)
            Text(
              'Selected date: '
                  '${selectedDate!.day}/'
                  '${selectedDate!.month}/'
                  '${selectedDate!.year}',
            ),

          const SizedBox(height: 16),

          // ---------------- TIME PICKER ----------------

          const Text(
            '5. Time Picker',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          ElevatedButton.icon(
            onPressed: chooseTime,
            icon: const Icon(Icons.access_time),
            label: const Text('Choose Time'),
          ),

          if (selectedTime != null)
            Text(
              'Selected time: ${selectedTime!.format(context)}',
            ),
        ],
      ),
    );
  }
}



class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Demo'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          // COLUMN
          const Text(
            'Column Layout',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Colors.deepPurple.shade100,
                child: const Text(
                  'Item 1',
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 8),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Colors.deepPurple.shade200,
                child: const Text(
                  'Item 2',
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 8),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Colors.deepPurple.shade300,
                child: const Text(
                  'Item 3',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ROW
          const Text(
            'Row Layout',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Icon(
                    Icons.home,
                    size: 40,
                  ),
                  Text('Home'),
                ],
              ),

              Column(
                children: const [
                  Icon(
                    Icons.search,
                    size: 40,
                  ),
                  Text('Search'),
                ],
              ),

              Column(
                children: const [
                  Icon(
                    Icons.person,
                    size: 40,
                  ),
                  Text('Profile'),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),

          // PADDING
          const Text(
            'Padding',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.deepPurple.shade50,
            ),

            child: const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'This text is inside a Padding widget.',
              ),
            ),
          ),

          const SizedBox(height: 24),

          // LIST VIEW
          const Text(
            'ListView',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // A horizontal ListView.
          SizedBox(
            height: 120,

            child: ListView(
              scrollDirection: Axis.horizontal,

              children: [
                LayoutCard(
                  title: 'One',
                  icon: Icons.looks_one,
                ),

                LayoutCard(
                  title: 'Two',
                  icon: Icons.looks_two,
                ),

                LayoutCard(
                  title: 'Three',
                  icon: Icons.looks_3,
                ),

                LayoutCard(
                  title: 'Four',
                  icon: Icons.looks_4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LayoutCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const LayoutCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}



class AppStructurePage extends StatefulWidget {
  const AppStructurePage({super.key});

  @override
  State<AppStructurePage> createState() => _AppStructurePageState();
}

class _AppStructurePageState extends State<AppStructurePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    Center(
      child: Text(
        'Home Screen',
        style: TextStyle(fontSize: 28),
      ),
    ),

    Center(
      child: Text(
        'Favorites Screen',
        style: TextStyle(fontSize: 28),
      ),
    ),

    Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 28),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.flutter_dash,
                    size: 50,
                    color: Colors.white,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Flutter Lab 4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),

              onTap: () {
                Navigator.pop(context);

                setState(() {
                  selectedIndex = 0;
                });
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),

              onTap: () {
                Navigator.pop(context);

                setState(() {
                  selectedIndex = 1;
                });
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),

              onTap: () {
                Navigator.pop(context);

                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),



      body: pages[selectedIndex],


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Floating Action Button pressed'),
            ),
          );
        },

        child: const Icon(Icons.add),
      ),



      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



class CommonFixesPage extends StatelessWidget {
  const CommonFixesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI Fixes'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          // ThemeData example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'ThemeData',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'This application uses ThemeData to provide '
                        'consistent colors, typography and widget styles.',
                  ),

                  const SizedBox(height: 16),

                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check),
                    label: const Text('Theme Button'),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Common UI Fixes',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const FixCard(
            icon: Icons.phone_android,
            title: 'Responsive Layout',
            description:
            'Use Expanded, Flexible or ListView when content '
                'may exceed the available screen size.',
          ),

          const FixCard(
            icon: Icons.padding,
            title: 'Use Padding',
            description:
            'Add appropriate spacing around widgets to avoid '
                'crowded UI.',
          ),

          const FixCard(
            icon: Icons.format_size,
            title: 'Text Overflow',
            description:
            'Use Flexible, Expanded or maxLines to prevent '
                'long text from overflowing.',
          ),

          const FixCard(
            icon: Icons.list,
            title: 'Scrollable Content',
            description:
            'Use ListView when a page contains content that '
                'may not fit on the screen.',
          ),

          const FixCard(
            icon: Icons.palette,
            title: 'Consistent Theme',
            description:
            'Use Theme.of(context) instead of hard-coding '
                'colors throughout the application.',
          ),
        ],
      ),
    );
  }
}

class FixCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FixCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(description),
        ),
      ),
    );
  }
}