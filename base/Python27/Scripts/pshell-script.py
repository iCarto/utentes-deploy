#!E:\utentes-ara-norte-20160915\Python27\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'pyramid==1.6.1','console_scripts','pshell'
__requires__ = 'pyramid==1.6.1'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('pyramid==1.6.1', 'console_scripts', 'pshell')()
    )
