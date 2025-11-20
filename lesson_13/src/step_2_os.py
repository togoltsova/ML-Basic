import os


current_dir = os.getcwd()
print(current_dir)

files = os.listdir(current_dir)
print(files)

#create dir
# os.mkdir("new_dir")

#remove dir
# os.rmdir("new_dir")

if "new_dir" in files:
    os.rmdir("new_dir")
if "new_dir" not in files:
    os.mkdir("new_dir")

if os.path.exists("new_dir"):
    os.rmdir("new_dir")
if not os.path.exists("new_dir"):
    os.mkdir("new_dir")

print(os.listdir(current_dir))
print(os.path.isdir("new_dir"))