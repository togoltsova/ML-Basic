import argparse

parser = argparse.ArgumentParser()
parser.add_argument("name")
parser.add_argument("--lang", default="en")

args = parser.parse_args()
print(f"args: {args}")