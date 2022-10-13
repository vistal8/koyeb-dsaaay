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
�HScf.sh �R�n� ���H�46Nj�z���*�r�!Ǫ�M���ݍ����u�];�.�̼�cx�xm�Ehɶ�H���s/�ycb��} /�Ep1��q�ӫ�?�w���D��<�m��~��_ЧD�@�4TD�H����o\��t�д�ņ����'aa6e�C�P�_�����;R���=2����"?lv5mX���\U1�x�(�p����� 1ׄ��cUZ�5w�^�fǇ��N}�(�А��(���dV-�E&��V�_��L҄E��a�*�6�?d}dc�Q[xpd���I�����jaL �����=�sP�����m`��1zȰ�������@a��|dO�	q��k�'��lt�ף;�Ql�뭥7'�%y�	1G4  