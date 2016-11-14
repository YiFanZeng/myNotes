##############################################################################################
[root@ip-172-31-26-104 ~]# cat /proc/net/dev
Inter-|   Receive                                                |  Transmit
 face |bytes    packets errs drop fifo frame compressed multicast|bytes    packets errs drop fif
  eth0: 471116054  572761    0    0    0     0          0         0 74001508  442321    0    0  
    lo:     340       4    0    0    0     0          0         0      340       4    0    0    
471116054字节(b)=449.2912807兆字节(mb)


##############################################################################################
# 查看目录大小
[root@zengyifan myNotes]# du -h --max-depth=1


#############################################################################################
use vim:
* move
  * o/O
  * i/a
  * 0
  * w/W
  * e/E
  * % ({[
* Undo/Redo
  * u
  * C-u
* open/save/exit filel
  * :e path/to/file
  * :saves path/to/file
  * :w/ZZ/:x
  * :bn/:bp/:n
* insert mode
  * C-n/C-p
  * 
