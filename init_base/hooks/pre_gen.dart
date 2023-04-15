import 'package:mason/mason.dart';
import 'package:template_utils/file_utils.dart';

Future<void> run(HookContext context) async {
  final rootDir = projectRootDir(context.vars["root_folder_path"]);

  context.vars = {
    ...context.vars,
    "app_package": await getAppPackage(rootDir),
  };
  context.logger.err("Generating init base, variables: ${context.vars}");
}
