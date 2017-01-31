#!E:\utentes-ara-norte-20160915\Python27\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'utentes==0.0','console_scripts','initialize_utentes_db'
__requires__ = 'utentes==0.0'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('utentes==0.0', 'console_scripts', 'initialize_utentes_db')()
    )
