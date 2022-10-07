#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��cf.sh �RMS�0��W�p���R���p�����|l1�L����n?ha0�$���}���&�Ƃ�wBt	�J��^�\ �:��_��S��}x�dOh���{���/``��2�X��6][��U�B_�#�U�>���ɨ�l�Mؠ�%Y�G��߮��>�Cڮ|���F�]s�k1�>L�5U&R�O�h<V*�K9Dbr�E�4O���T��,uT�	��Tr1�<����1�=փ,̭tߛ���i΍���(8����FY;t���w����ӯA�E���O�/w 
׬�GJR�"!q�]lPr���4j��8�?�牟�  