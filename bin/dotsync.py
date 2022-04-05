#!/usr/bin/python3

"""
Dotfiles syncronization.
Based on https://gist.github.com/490016
"""

import os
import glob

SOURCE_DIR = '~/dotfiles/dots'

class bcolors:
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    ENDC = '\033[0m'

    def disable(self):
        self.OKBLUE = ''
        self.OKGREEN = ''
        self.WARNING = ''
        self.ENDC = ''

def force_remove(path):
    if os.path.isdir(path) and not os.path.islink(path):
        shutil.rmtree(path, False, on_error)
    else:
        os.unlink(path)

def is_link_to(link, dest): 
    is_link = os.path.islink(link)
    is_link = is_link and os.readlink(link).rstrip('/') == dest.rstrip('/')
    return is_link

def main():
    os.chdir(os.path.expanduser(SOURCE_DIR))
    for filename in [file for file in glob.glob('*')]:
        dotfile = '.' + filename
        dotfile = os.path.join(os.path.expanduser('~'), dotfile)
        source = os.path.abspath(filename)

        # Check that we aren't overwriting anything
        if os.path.lexists(dotfile):
            if is_link_to(dotfile, source):
                continue

            print(f"{bcolors.WARNING}File \"%s\" exists: {bcolors.ENDC}" % dotfile)
            response = input("  (r)emove, (b)ackup, (s)kip file \"%s\"? " % dotfile)
            if response.lower().startswith('r'):
                force_remove(dotfile)
                print(f"{bcolors.OKBLUE}Removed %s{bcolors.ENDC}" % (dotfile))
            
            elif response.lower().startswith('b'):
                os.rename(dotfile, dotfile + '.backup')
                print(f"{bcolors.OKBLUE}Renamed %s => %s{bcolors.ENDC}" % (dotfile,dotfile + '.backup'))

            elif response.lower().startswith('s'):
                print(f"{bcolors.OKBLUE}Skipping \"%s\"...{bcolors.ENDC}" % dotfile)
                continue
        
        os.symlink(source, dotfile)
        print(f"{bcolors.OKGREEN}%s => %s{bcolors.ENDC}" % (dotfile,source))
        print()

if __name__ == '__main__':
    main()