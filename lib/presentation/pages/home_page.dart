import 'package:flutter/material.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String? _aiResponse;

  Future<void> _sendToAI() async {
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BrainMorph', style: TextStyle(fontWeight: FontWeight.w500),),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _aiResponse != null
                ? ListView(children: [Text(_aiResponse!)])
                : const Center(child: Text('Write a message!',style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400))),
          ),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask BrainMorph..',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: _sendToAI,
                  mini: true,
                  backgroundColor: isLight ? Colors.black : Colors.white,
                  foregroundColor: isLight ? Colors.white : Colors.black,
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}