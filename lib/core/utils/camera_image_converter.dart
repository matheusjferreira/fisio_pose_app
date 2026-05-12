import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

Future<Uint8List> convertCameraImage(CameraImage image) async {
  final width = image.width;
  final height = image.height;

  final imgBuffer = img.Image(width: width, height: height);

  final planeY = image.planes[0];
  final planeU = image.planes[1];
  final planeV = image.planes[2];

  final bytesY = planeY.bytes;
  final bytesU = planeU.bytes;
  final bytesV = planeV.bytes;

  final rowStrideY = planeY.bytesPerRow;
  final rowStrideUV = planeU.bytesPerRow;
  final pixelStrideUV = planeU.bytesPerPixel!;

  for (int y = 0; y < height; y++) {
    final uvRow = (y ~/ 2) * rowStrideUV;

    for (int x = 0; x < width; x++) {
      final uvIndex = uvRow + (x ~/ 2) * pixelStrideUV;
      final yIndex = y * rowStrideY + x;

      final Y = bytesY[yIndex];
      final U = bytesU[uvIndex];
      final V = bytesV[uvIndex];

      int r = (Y + 1.402 * (V - 128)).round();
      int g = (Y - 0.344136 * (U - 128) - 0.714136 * (V - 128)).round();
      int b = (Y + 1.772 * (U - 128)).round();

      r = r.clamp(0, 255);
      g = g.clamp(0, 255);
      b = b.clamp(0, 255);

      imgBuffer.setPixelRgb(x, y, r, g, b);
    }
  }

  return Uint8List.fromList(img.encodeJpg(imgBuffer, quality: 90));
}
