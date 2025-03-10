import 'package:mason/mason.dart';
import 'package:template_utils/file_utils.dart';

void run(HookContext context) {
  final rootDir = projectRootDir(context.vars["root_folder_path"]);

  var componentName = (context.vars["name"] as String? ?? "").trim().pascalCase;
  var componentType = (context.vars["type"] as String? ?? "").trim().lowerCase;
  var featureName = (context.vars["feature_name"] as String? ?? "").trim().lowerCase;

  if (componentName.isEmpty) {
    throw "Cannot use empty name for component";
  }
  if (componentType.isEmpty) {
    throw "Cannot use empty type for component";
  }

  final type = componentType == "completes"
      ? "C"
      : componentType == "templates"
          ? "T"
          : "P";
  final name = "Kit$type${featureName.pascalCase}$componentName";

  final relativeRoot = relativeRootDir(rootDir);

  context.vars = {
    "name": name,
    "uikit_file": "$relativeRoot/lib/uikit/beauty/$componentType/$featureName/${name.snakeCase}.dart",
    "uikit_import": "package:beautyverse/uikit/beauty/$componentType/$featureName/${name.snakeCase}.dart",
    "test_file": "$relativeRoot/test/widgets/beauty/$componentType/$featureName/${name.snakeCase}_test.dart",
    "widgetbook_file": "$relativeRoot/lib/widgetbook/$componentType/$featureName/${name.snakeCase}_component.dart",
  };
}
