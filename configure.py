#!/usr/bin/env python

import yaml
import subprocess
import argparse

# ------------------------------------------
# --------------argument-parse--------------
# ------------------------------------------
parser = argparse.ArgumentParser(description='Configure the system')
parser.add_argument("--show",
                    help="Show what can you execute",
                    action='store_true'
                    )
parser.add_argument("--command",
                    help="Command to execute from list",
                    )

# ---------------------------------------
# -------------actual-script-------------
# ---------------------------------------

def print_dict_keys(dictionary, indent=0):
    for key, value in dictionary.items():
        print(" " * indent, key)
        if (isinstance(value, dict)):
            print_dict_keys(value, indent+4)

def get_dict_key(dictionary, keys):
    assert dictionary is not None, "key error. check if command exists"
    if "." in keys:
        key, rest = keys.split(".", 1)
        print()
        return get_dict_key(dictionary.get(key), rest)
    else:
        return dictionary[keys]

def run_command(command):
    sp = subprocess.run(command.split(), stdout=subprocess.PIPE)
    print(sp.stdout)

def main(bst):
    args = parser.parse_args()

    if (args.show):
        print_dict_keys(bst.get("command"))
    elif (args.command):
        command = get_dict_key(bst.get("command"), args.command)
        assert isinstance(command, str), "command must not be parent, incorrect usage"

        action = get_dict_key(bst.get("action"), args.command)
        assert isinstance(action, list), "command actions must be a list, fix yaml file"

        for act in action:
            run_command("{} {}".format(command, act))
    else:
        parser.print_help()

# ------------------------------------------
# --------------load-yaml-file--------------
# ------------------------------------------
with open("bootstrap.yml", "r") as stream:
    try:
        main(yaml.safe_load(stream))
    except yaml.YAMLError as exc:
        print(exc)
