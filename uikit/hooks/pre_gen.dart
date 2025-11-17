import 'package:mason/mason.dart';
import 'package:template_utils/file_utils.dart';

void run(HookContext context) {
  final rootDir = projectRootDir(context.vars["root_folder_path"]);

  var componentName = (context.vars["name"] as String? ?? "").trim().pascalCase;
  var componentType = (context.vars["type"] as String? ?? "").trim().lowerCase;
  var groupName = (context.vars["group_name"] as String? ?? "").trim().lowerCase;

  if (componentName.isEmpty) {
    throw "Cannot use empty name for component";
  }
  if (componentType.isEmpty) {
    throw "Cannot use empty type for component";
  }

  final type = componentType == "complete"
      ? ""
      : "Base";
      
  final name = "Kit${groupName.pascalCase}$componentName$type";

  final relativeRoot = relativeRootDir(rootDir);

  context.vars = {
    "name": name,
    "uikit_file": "$relativeRoot/lib/uikit${type == "base" ?  '/base' : ''}/$groupName/${name.snakeCase}.dart",
    "uikit_import": "package:beautyverse/uikit${type == "base" ?  '/base' : ''}/$groupName/${name.snakeCase}.dart",
    "test_file": "$relativeRoot/test/widgets/uikit${type == "base" ?  '/base' : ''}/$groupName/${name.snakeCase}_test.dart",
  };
}
