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
���df.sh �RMS�0��W�p��|���p�����4�b4�2I
:L���P��������e���0��ҽ1��k�\�z�Sm�)��b�|~�a
���ّ�b	Cq���o��LH���n��1�W�/'Ι]+h�K~ԫ��6vd}ϢY�F,yRT�o��6Ձ�7����*�}���:ތ�Kʚ�i?��8�C9F�dȱ���p���A4N[�*�x��R*���_E_��D����Ё�,,Qٯ��T�4��A���[�-����F!�ُ��'�m���Ǡ��������Z������rV�"ca�lhHIS��6Cԃ�p�o�#���  