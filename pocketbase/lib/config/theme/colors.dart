import '../../app/shared/models/app_color_model.dart';
import '../../helpers/helpers.dart';
import 'color_palette.dart';

/// [lightColors] returns [AppColorModel] containing light theme colors
final AppColorModel lightColors = AppColorModel(
  /// Theme Colors
  accent: kcAccent,
  danger: kcDanger,
  success: kcSuccess,
  info: kcInfo,
  warning: kcWarning,

  /// Primary Colors
  primarySurfaceLighter: kcWhite,
  primarySurfaceLight: kcWhite,
  primarySurface: kcWhite,
  primarySurfaceDark: kcSlate.shade200,
  primarySurfaceDarker: kcSlate.shade400,

  primaryContentLighter: kcSlate.shade700,
  primaryContentLight: kcSlate.shade700,
  primaryContent: kcSlate.shade600,
  primaryContentDark: kcSlate.shade600,
  primaryContentDarker: kcSlate.shade600,

  /// Secondary Colors
  secondarySurfaceLighter: kcSlate.shade50,
  secondarySurfaceLight: kcSlate.shade100.withAlpha(alpha(0.75)),
  secondarySurface: kcSlate.shade100,
  secondarySurfaceDark: kcSlate.shade200,
  secondarySurfaceDarker: kcSlate.shade300,

  secondaryContentLighter: kcSlate.shade800,
  secondaryContentLight: kcSlate.shade700,
  secondaryContent: kcSlate.shade600,
  secondaryContentDark: kcSlate.shade700,
  secondaryContentDarker: kcSlate.shade800,
);

/// [darkColors] returns [AppColorModel] containing dark theme colors
final AppColorModel darkColors = AppColorModel(
  /// Theme Colors
  accent: kcAccent,
  danger: kcDanger,
  success: kcSuccess,
  info: kcInfo,
  warning: kcWarning,

  /// Primary Colors
  primarySurfaceLighter: kcSlate.shade600,
  primarySurfaceLight: kcSlate.shade700,
  primarySurface: kcSlate.shade800,
  primarySurfaceDark: kcSlate.shade900,
  primarySurfaceDarker: kcSlate.shade900,

  primaryContentLighter: kcSlate.shade50,
  primaryContentLight: kcSlate.shade100,
  primaryContent: kcSlate.shade100,
  primaryContentDark: kcSlate.shade200,
  primaryContentDarker: kcSlate.shade300,

  /// Secondary Colors
  secondarySurfaceLighter: kcSlate.shade500,
  secondarySurfaceLight: kcSlate.shade600,
  secondarySurface: kcSlate.shade700,
  secondarySurfaceDark: kcSlate.shade800,
  secondarySurfaceDarker: kcSlate.shade900,

  secondaryContentLighter: kcZinc.shade50,
  secondaryContentLight: kcZinc.shade100,
  secondaryContent: kcZinc.shade100,
  secondaryContentDark: kcZinc.shade200,
  secondaryContentDarker: kcZinc.shade300,
);
