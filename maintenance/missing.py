#!/usr/bin/env python3.7
# -*- coding: utf-8 -*-

"""
missing.py: Check if all packages in katoolin4s
            package list are in the repository.

Invoke with: sudo PYTHONPATH=.. ./missing.py
"""

import katoolin4

if __name__ == "__main__":
    with katoolin4.APTManager(silent=True) as apt_mgr:
        for pkg in katoolin4.all_packages():
            if not apt_mgr.has_package(pkg):
                print(pkg)
