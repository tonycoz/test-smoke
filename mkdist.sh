#! /bin/sh

distdir=~/distro

perl test_compile.pl || exit
perl test_pod.pl     || exit
cd private
perl smoker.t || (cd .. ; exit)
cd ..
PERL_MM_USE_DEFAULT=y
export PERL_MM_USE_DEFAULT
echo Set default input: $PERL_MM_USE_DEFAULT
perl Makefile.PL
make
(make test) || exit
make dist
mv -v *.tar.gz $distdir
make veryclean > /dev/null
rm -f */*/*/*~
