import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_custom/models/case_model.dart';
import 'package:app_custom/screens/preview_screen.dart';
import 'package:app_custom/widgets/image_source_dialog.dart';

class CustomizationScreen extends StatefulWidget {
  final CaseModel caseModel;

  const CustomizationScreen({
    super.key,
    required this.caseModel,
  });

  @override
  State<CustomizationScreen> createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  File? _selectedImage;
  String? _networkImageUrl;
  final TextEditingController _urlController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1800,
        maxHeight: 1800,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          _networkImageUrl = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al seleccionar imagen: $e')),
      );
    }
  }

  void _setNetworkImage(String url) {
    if (url.isNotEmpty) {
      setState(() {
        _networkImageUrl = url;
        _selectedImage = null;
      });
    }
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize ${widget.caseModel.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diseña tu funda',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Añade imágenes y personaliza la funda de tu celular',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 300,
                height: 600,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Imagen personalizada del usuario
                      if (_selectedImage != null || _networkImageUrl != null)
                        InteractiveViewer(
                          maxScale: 3.0,
                          minScale: 0.5,
                          boundaryMargin: const EdgeInsets.all(double.infinity),
                          child: _selectedImage != null
                              ? Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  _networkImageUrl!,
                                  fit: BoxFit.cover,
                                ),
                        )
                      else
                        Container(color: Colors.grey[300]),

                      IgnorePointer(
                        child: widget.caseModel.imageCase.startsWith('/data/')
                            ? Image.file(
                                File(widget.caseModel.imageCase),
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.caseModel.imageCase,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ImageSourceDialog(
                          onCameraTap: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.camera);
                          },
                          onGalleryTap: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.gallery);
                          },
                          onUrlTap: () {
                            Navigator.pop(context);
                            _showUrlInputDialog();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.add_photo_alternate),
                    label: const Text('Imagen'),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: (_selectedImage != null || _networkImageUrl != null)
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PreviewScreen(
                                  caseModel: widget.caseModel,
                                  localImage: _selectedImage,
                                  networkImageUrl: _networkImageUrl,
                                ),
                              ),
                            );
                          }
                        : null,
                    icon: const Icon(Icons.visibility),
                    label: const Text('Ver'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showUrlInputDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ingresar una URL'),
        content: TextField(
          controller: _urlController,
          decoration: const InputDecoration(
            hintText: 'https://example.com/image.jpg',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.url,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              _setNetworkImage(_urlController.text);
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }
}