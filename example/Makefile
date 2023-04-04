# Creates new page using class mason templates
new_page:
	@pushd tools/templates; mason get; mason make page --root_folder_path $(shell pwd); popd

# Creates new use_case class using mason templates
new_use_case:
	mason get; mason make use_case --root_folder_path $(shell pwd);

init_base:
	mason get; mason make init_base --root_folder_path $(shell pwd);

# Creates new repository class using mason templates
new_repository:
	@pushd tools/templates; mason get; mason make repository --root_folder_path $(shell pwd); popd

# # Moves and/or renames repository class using mason templates
# move_repository:
# 	@pushd tools/templates; mason get; mason make move_repository --root_folder_path $(shell pwd); popd

# # Moves and/or renames page class using mason templates
# move_page:
# 	@pushd tools/templates; mason get; mason make move_page --root_folder_path $(shell pwd); popd