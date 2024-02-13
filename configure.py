#!/usr/bin/env python

import yaml
import subprocess
import argparse

# ------------------------------
# ----------dot-access----------
# ------------------------------
class edict(dict):
    # https://gist.github.com/markhu/fbbab71359af00e527d0?permalink_comment_id=3189115#gistcomment-3189115
    
    __setattr__= dict.__setitem__
    __delattr__= dict.__delitem__

    def __init__(self, data):
        if isinstance(data, str):
            data = json.loads(data)
    
        for name, value in data.items():
            setattr(self, name, self._wrap(value))

    def __getattr__(self, attr):
        def _traverse(obj, attr):
            if self._is_indexable(obj):
                try:
                    return obj[int(attr)]
                except:
                    return None
            elif isinstance(obj, dict):
                return obj.get(attr, None)
            else:
                return attr
        if '.' in attr:
            return reduce(_traverse, attr.split('.'), self)
        return self.get(attr, None)

    def _wrap(self, value):
        if self._is_indexable(value):
            # (!) recursive (!)
            return type(value)([self._wrap(v) for v in value])
        elif isinstance(value, dict):
            return edict(value)
        else:
            return value
    
    @staticmethod
    def _is_indexable(obj):
        return isinstance(obj, (tuple, list, set, frozenset))

# ------------------------------------------
# --------------argument-parse--------------
# ------------------------------------------
parser = argparse.ArgumentParser(description='Configure the system')
parser.add_argument("--show",
                    help="Show what can you execute",
                    metavar="",
                    action=argparse.BooleanOptionalAction,
                    type=bool)
parser.add_argument("--command",
                    help="Command to execute from list",
                    type=str)

# ---------------------------------------
# -------------actual-script-------------
# ---------------------------------------
# def show_commands(bst):


def run_command(command):
    sp = subprocess.run(command.split(), stdout=subprocess.PIPE)
    print(sp.stdout)

def main(bst):
    args = parser.parse_args()

    if (args.show):
        print('showing arguments')
    elif (args.command):
        print("executing command", args.command)
    else:
        parser.print_help()

    # run_command(bst.commands.list_packages.flatpak)

# ------------------------------------------
# --------------load-yaml-file--------------
# ------------------------------------------
with open("bootstrap.yml", "r") as stream:
    try:
        main(edict(yaml.safe_load(stream)))
    except yaml.YAMLError as exc:
        print(exc)