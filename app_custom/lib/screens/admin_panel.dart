import 'package:app_custom/models/case_repository.dart';
import 'package:flutter/material.dart';
import 'package:app_custom/models/case_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _price = TextEditingController();

  File? _pickedImage;
  File? _pickedTemplate;
  final ImagePicker _picker = ImagePicker();

  final List<CaseModel> _addedCases = [];

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedImage = File(picked.path);
      });
    }
  }

  Future<void> _pickTemplate() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedTemplate = File(picked.path);
      });
    }
  }

  void _addCase() {
    if (_name.text.isEmpty || _price.text.isEmpty || _pickedImage == null || _pickedTemplate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa todos los campos')),
      );
      return;
    }

    final newCase = CaseModel(
      name: _name.text,
      description: _desc.text,
      imagePath: _pickedImage!.path,
      imageCase: _pickedTemplate!.path,
      price: double.tryParse(_price.text) ?? 0.0,
    );

    setState(() {
      _addedCases.add(newCase);
      CaseRepository.addCase(newCase);
      _name.clear();
      _desc.clear();
      _price.clear();
      _pickedImage = null;
      _pickedTemplate = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ Modelo añadido')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de administrador')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Agregar nuevo modelo de funda',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(controller: _name, decoration: const InputDecoration(labelText: 'Nombre')),
          TextField(controller: _desc, decoration: const InputDecoration(labelText: 'Descripción')),
          TextField(
            controller: _price,
            decoration: const InputDecoration(labelText: 'Precio'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),

          ElevatedButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
            label: const Text('Seleccionar imagen de vista previa'),
          ),
          if (_pickedImage != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.file(_pickedImage!, height: 100),
            ),

          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: _pickTemplate,
            icon: const Icon(Icons.layers),
            label: const Text('Seleccionar plantilla de funda'),
          ),
          if (_pickedTemplate != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.file(_pickedTemplate!, height: 100),
            ),

          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _addCase,
            icon: const Icon(Icons.add),
            label: const Text('Agregar modelo'),
          ),

          const Divider(height: 32),
          const Text('Modelos agregados:', style: TextStyle(fontWeight: FontWeight.bold)),
          ..._addedCases.map((c) => ListTile(
                title: Text(c.name),
                subtitle: Text('S/. ${c.price.toStringAsFixed(2)}'),
              )),
        ],
      ),
    );
  }
}