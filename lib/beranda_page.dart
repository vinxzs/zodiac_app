import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'hasil_page.dart';
import 'ramalan_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tglController = TextEditingController();
  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _tglController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _ramal(BuildContext context) {
    if (_namaController.text.isNotEmpty && _selectedDate != null) {
      Provider.of<RamalProvider>(
        context,
        listen: false,
      ).setData(_namaController.text, _selectedDate!);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResultPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ramal App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/foto.jpeg'), width: 80),
            const Text('Kevin Oktavian'),
            const Text('2310501103'),
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _tglController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _ramal(context),
              child: const Text('Ramal'),
            ),
          ],
        ),
      ),
    );
  }
}