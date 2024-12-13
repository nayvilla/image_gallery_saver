import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Save image to gallery test', (WidgetTester tester) async {
    // Simula datos de imagen para guardar
    final Uint8List imageData = Uint8List.fromList(List.generate(100, (index) => index % 256));

    // Intenta guardar la imagen
    final result = await ImageGallerySaver.saveImage(imageData, quality: 60, name: "test_image");

    // Verifica que el resultado no sea nulo o vacío
    expect(result, isNotNull);
    expect(result['isSuccess'], true);
  });

  testWidgets('Save file to gallery test', (WidgetTester tester) async {
    // Simula la ruta de un archivo temporal
    final String fakePath = '/fake/path/to/file.mp4';

    // Intenta guardar el archivo
    final result = await ImageGallerySaver.saveFile(fakePath);

    // Verifica que el resultado no sea nulo o vacío
    expect(result, isNotNull);
    expect(result['isSuccess'], false); // Aquí fallará porque es un path falso.
  });
}
