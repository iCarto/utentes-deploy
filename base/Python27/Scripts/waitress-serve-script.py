#!E:\utentes-ara-norte-20160915\Python27\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'waitress==0.8.10','console_scripts','waitress-serve'
__requires__ = 'waitress==0.8.10'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('waitress==0.8.10', 'console_scripts', 'waitress-serve')()
    )
