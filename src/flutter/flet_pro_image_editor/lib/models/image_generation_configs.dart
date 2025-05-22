import 'package:flutter/material.dart'; // For Color
import 'package:flet/flet.dart';
import './processor_configs.dart'; // Placeholder
import './size.dart';

// Define enums used by this config class
enum PngFilter {
  none,
  sub,
  up,
  average,
  paeth,
}

enum JpegChroma {
  yuv420,
  yuv422,
  yuv444,
}

enum OutputFormat {
  jpg,
  png,
}

class ImageGenerationConfigs {
  final bool cropToImageBounds;
  final bool cropToDrawingBounds;
  final bool allowEmptyEditingCompletion;
  final bool enableIsolateGeneration;
  final bool enableBackgroundGeneration;
  final bool enableUseOriginalBytes;
  final bool singleFrame;
  final double? customPixelRatio; // Nullable
  final int jpegQuality;
  final int pngLevel;
  final PngFilter pngFilter;
  final JpegChroma jpegChroma;
  final Color jpegBackgroundColor;
  final OutputFormat outputFormat;
  final ProcessorConfigs processorConfigs; // Placeholder
  final Size maxOutputSize;
  final Size maxThumbnailSize;

  const ImageGenerationConfigs({
    this.cropToImageBounds = true,
    this.cropToDrawingBounds = true,
    this.allowEmptyEditingCompletion = true,
    this.enableIsolateGeneration = true,
    this.enableBackgroundGeneration = true,
    this.enableUseOriginalBytes = true,
    this.singleFrame = false,
    this.customPixelRatio, // Nullable
    this.jpegQuality = 100,
    this.pngLevel = 6,
    this.pngFilter = PngFilter.none,
    this.jpegChroma = JpegChroma.yuv444,
    this.jpegBackgroundColor = const Color(0xFFFFFFFF),
    this.outputFormat = OutputFormat.jpg,
    this.processorConfigs = const ProcessorConfigs(), // Placeholder
    this.maxOutputSize = const Size(width: 2000, height: 2000),
    this.maxThumbnailSize = const Size(width: 100, height: 100),
  });

  factory ImageGenerationConfigs.fromJson(ThemeData? theme, Map<String, dynamic> json) {
    PngFilter tempPngFilter = PngFilter.none;
    dynamic rawPngFilter = json['pngFilter'];
    if (rawPngFilter is String) {
      tempPngFilter = PngFilter.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawPngFilter.toLowerCase(),
        orElse: () => PngFilter.none
      );
    } else if (PngFilter.values.contains(rawPngFilter)) {
      tempPngFilter = rawPngFilter;
    }

    JpegChroma tempJpegChroma = JpegChroma.yuv444;
    dynamic rawJpegChroma = json['jpegChroma'];
    if (rawJpegChroma is String) {
      tempJpegChroma = JpegChroma.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawJpegChroma.toLowerCase(),
        orElse: () => JpegChroma.yuv444
      );
    } else if (JpegChroma.values.contains(rawJpegChroma)) {
      tempJpegChroma = rawJpegChroma;
    }

    OutputFormat tempOutputFormat = OutputFormat.jpg;
    dynamic rawOutputFormat = json['outputFormat'];
    if (rawOutputFormat is String) {
      tempOutputFormat = OutputFormat.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == rawOutputFormat.toLowerCase(),
        orElse: () => OutputFormat.jpg
      );
    } else if (OutputFormat.values.contains(rawOutputFormat)) {
      tempOutputFormat = rawOutputFormat;
    }

    return ImageGenerationConfigs(
      cropToImageBounds: parseBool(json['cropToImageBounds'], true),
      cropToDrawingBounds: parseBool(json['cropToDrawingBounds'], true),
      allowEmptyEditingCompletion: parseBool(json['allowEmptyEditingCompletion'], true),
      enableIsolateGeneration: parseBool(json['enableIsolateGeneration'], true),
      enableBackgroundGeneration: parseBool(json['enableBackgroundGeneration'], true),
      enableUseOriginalBytes: parseBool(json['enableUseOriginalBytes'], true),
      singleFrame: parseBool(json['singleFrame'], false),
      customPixelRatio: json['customPixelRatio'] as double?,
      jpegQuality: parseInt(json['jpegQuality'], 100),
      pngLevel: parseInt(json['pngLevel'], 6),
      pngFilter: tempPngFilter,
      jpegChroma: tempJpegChroma,
      jpegBackgroundColor: parseColor(theme, json['jpegBackgroundColor'] as String?, const Color(0xFFFFFFFF)),
      outputFormat: tempOutputFormat,
      processorConfigs: json['processorConfigs'] != null ? ProcessorConfigs.fromJson(json['processorConfigs'] is Map ? Map<String, dynamic>.from(json['processorConfigs'] as Map) : {}) : const ProcessorConfigs(),
      maxOutputSize: json['maxOutputSize'] != null ? Size.fromJson(json['maxOutputSize'] is Map ? Map<String, dynamic>.from(json['maxOutputSize'] as Map) : {}) : const Size(width: 2000, height: 2000),
      maxThumbnailSize: json['maxThumbnailSize'] != null ? Size.fromJson(json['maxThumbnailSize'] is Map ? Map<String, dynamic>.from(json['maxThumbnailSize'] as Map) : {}) : const Size(width: 100, height: 100),
    );
  }
}
