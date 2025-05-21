import 'package:flutter/material.dart'; // For Color
import '../utils/json_utils.dart' as utils;
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

  factory ImageGenerationConfigs.fromJson(Map<String, dynamic> json) {
    return ImageGenerationConfigs(
      cropToImageBounds: utils.JsonUtils.parseBool(json['cropToImageBounds'], true),
      cropToDrawingBounds: utils.JsonUtils.parseBool(json['cropToDrawingBounds'], true),
      allowEmptyEditingCompletion: utils.JsonUtils.parseBool(json['allowEmptyEditingCompletion'], true),
      enableIsolateGeneration: utils.JsonUtils.parseBool(json['enableIsolateGeneration'], true),
      enableBackgroundGeneration: utils.JsonUtils.parseBool(json['enableBackgroundGeneration'], true),
      enableUseOriginalBytes: utils.JsonUtils.parseBool(json['enableUseOriginalBytes'], true),
      singleFrame: utils.JsonUtils.parseBool(json['singleFrame'], false),
      customPixelRatio: json['customPixelRatio'] as double?,
      jpegQuality: utils.JsonUtils.parseInt(json['jpegQuality'], 100),
      pngLevel: utils.JsonUtils.parseInt(json['pngLevel'], 6),
      pngFilter: utils.JsonUtils.parseEnum(PngFilter.values, json['pngFilter'], PngFilter.none),
      jpegChroma: utils.JsonUtils.parseEnum(JpegChroma.values, json['jpegChroma'], JpegChroma.yuv444),
      jpegBackgroundColor: utils.JsonUtils.parseColor(json['jpegBackgroundColor'], const Color(0xFFFFFFFF)),
      outputFormat: utils.JsonUtils.parseEnum(OutputFormat.values, json['outputFormat'], OutputFormat.jpg),
      processorConfigs: json['processorConfigs'] != null ? ProcessorConfigs.fromJson(utils.JsonUtils.parseMap(json['processorConfigs'])) : const ProcessorConfigs(),
      maxOutputSize: json['maxOutputSize'] != null ? Size.fromJson(utils.JsonUtils.parseMap(json['maxOutputSize'])) : const Size(width: 2000, height: 2000),
      maxThumbnailSize: json['maxThumbnailSize'] != null ? Size.fromJson(utils.JsonUtils.parseMap(json['maxThumbnailSize'])) : const Size(width: 100, height: 100),
    );
  }
}
