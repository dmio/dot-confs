set history filename ~/.gdb_history
set history remove-duplicates 1
set history save on
#source ~/gdb-scripts/luagdb.txt
source ~/gdb-scripts/gdbx.py

python
sys.path.insert(0, '/home/day/gdb-scripts')
import hexdump
#import gdbx
end
add-auto-load-safe-path /home/day/work/my/lkt/l4/linux/scripts/gdb/vmlinux-gdb.py
