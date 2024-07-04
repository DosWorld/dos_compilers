str=$(tr '[a-z]' '[A-Z]' <<< $1)

rm $str.EXE 2>/dev/null
rm $str.MAP 2>/dev/null
rm $str.OBJ 2>/dev/null

ntvdm -r:.. -u -e:path=c:\\bin,lib=c:\\lib ../bin/ztc $str.c -Ic:\\include -ms -c -DDOSTIME
ntvdm -r:.. -u -e:path=c:\\bin,lib=c:\\lib ../bin/blink ct+$str, $str, $str, ZLs.LIB /noi /m\;

rm $str.MAP 2>/dev/null
rm $str.OBJ 2>/dev/null

ntvdm -r:. -u -p $str
