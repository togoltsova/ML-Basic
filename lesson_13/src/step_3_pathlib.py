import pathlib

current_dir = pathlib.Path.cwd()
print(current_dir)

files = []
for f in current_dir.iterdir():
    files.append(f.name)
print(files)

files_inside_all_dirs = list(current_dir.glob("*.py"))

current_file = pathlib.Path(__file__)
print(current_file)
print(current_file.parent)