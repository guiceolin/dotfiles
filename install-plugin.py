#! /usr/bin/env python
import argparse
import os
from lib.module_installer import ModuleInstaller
from lib.logger import Logger
from lib.plugin_lister import PluginLister
from lib.plugin_installer import PluginInstaller

current_dir = os.path.dirname(os.path.realpath(__file__))

parser = argparse.ArgumentParser(description='Install plugins for your dotfile')
parser.add_argument('-V','--verbose', dest='verbose', action='store_true', help='Verbose mode.')
parser.add_argument('--list', dest='list', action='store_true', help='List all available plugins.')
parser.add_argument('name', nargs='?', help='Name of plugin to install')

args = parser.parse_args()
logger = Logger(verbose=args.verbose)

if args.list:
  lister = PluginLister(current_dir)
  lister.list()
else:
  name = args.name
  if name:
    installer = PluginInstaller(name, current_dir, logger)
    installer.install()
  else:
    print "Please, give the nome of the plugin to install.\nTo see all available plugins, user --list option."
