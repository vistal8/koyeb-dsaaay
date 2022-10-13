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
�WYcf.sh �R=o�0��+\3�|�F�RQ��c��qΉKb#�! ��CZ ��žw���|�� 2H��Q��Ź�3Mk?6��ʀfJZ��g���O�Q�V�4M�AI��K���v�^9)G�"�\��x>_��ᗀ�𿌒耰R���p{�M���e�T�	:�r!U��8��̹�[a�߆��E�݂����q�}D+��:]�-��>Հ�Bf�����B�Fu�]��n�}X���G�(��(��E1��I8�X<��t�i�,uThaA/��n��&�y�FRahR�R`���dz��B5=�0С�-�h���Ql���yrm�o���$������q�������QD�w���vN�/s����&  