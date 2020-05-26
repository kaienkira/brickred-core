#!/bin/sh

usage()
{
    echo 'usage: config.sh [options]'
    echo '-h --help            print usage'
    echo '--prefix=<prefix>    install prefix'
    echo '--enable-baselog     enable base log'
    exit 1
}

brickred_install_prefix='/usr/local'
brickred_compile_flag=
brickred_link_flag=

options=`getopt -o h -l \
help,\
prefix:,\
enable-baselog\
 -- "$@"`
eval set -- "$options"

while [ $# -gt 0 ]
do
    case "$1" in
    -h|--help) usage;;
    --prefix) brickred_install_prefix=$2; shift;;
    --enable-baselog)
        brickred_compile_flag=$brickred_compile_flag' -DBRICKRED_BUILD_ENABLE_BASE_LOG'
        ;;
    --) shift; break;;
    *) usage;;
    esac
    shift
done

# check compiler
which g++ >/dev/null 2>&1
if [ $? -ne 0 ]
then
    echo 'can not find g++'
    exit 1
fi

# check make
which make >/dev/null 2>&1
if [ $? -ne 0 ]
then
    echo 'can not find make'
    exit 1
fi

# output
echo "BRICKRED_INSTALL_PREFIX = $brickred_install_prefix" >config.mak
echo "BRICKRED_COMPILE_FLAG = $brickred_compile_flag" >>config.mak
echo "BRICKRED_LINK_FLAG = $brickred_link_flag" >>config.mak
