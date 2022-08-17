#!/bin/bash

# Simple script to list version numbers of critical development tools
export LC_ALL=C

# General version info
cat /proc/version
echo

# Check bash
bash --version | head -n1 | cut -d" " -f2-4
MYSH=$(readlink -f /bin/sh)
echo "/bin/sh -> $MYSH"
echo $MYSH | grep -q bash || echo "ERROR: /bin/sh does not point to bash"
unset MYSH
echo

# Check binutils, coreutils
echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-
echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2
echo

# Check bison, yacc
bison --version | head -n1

if [ -h /usr/bin/yacc ]; then
  echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
elif [ -x /usr/bin/yacc ]; then
  echo yacc is `/usr/bin/yacc --version | head -n1`
else
  echo "yacc not found"
fi
echo

# Check bzip2
bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
echo

# Check diff, find
diff --version | head -n1
find --version | head -n1
echo

# Check awk/gawk
gawk --version | head -n1

if [ -h /usr/bin/awk ]; then
  echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
  echo awk is `/usr/bin/awk --version | head -n1`
else
  echo "awk not found"
fi
echo

# Check glibc
ldd --version | head -n1 | cut -d" " -f2-
echo

# Check grep, gzip, m4, make, patch
grep --version | head -n1
gzip --version | head -n1
m4 --version | head -n1
make --version | head -n1
patch --version | head -n1
echo

# Check perl, python3
echo Perl `perl -V:version`
python3 --version
echo

# Check sed, tar, texinfo, xz
sed --version | head -n1
tar --version | head -n1
makeinfo --version | head -n1
xz --version | head -n1
echo

# Check gcc, g++, and compilation
gcc --version | head -n1
g++ --version | head -n1

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c

if [ -x dummy ]
  then echo "g++ compilation OK";
  else echo "g++ compilation failed";
fi

rm -f dummy.c dummy
