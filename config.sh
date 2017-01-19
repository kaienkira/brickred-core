#!/bin/sh

usage()
{
    echo 'usage: config.sh [options]'
    echo '-h --help            print usage'
    echo '--prefix=<prefix>    install prefix'
    echo '--enable-baselog     enable base log'
    exit 1
}

opt_prefix='/usr/local'

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
    --prefix) opt_prefix=$2; shift;;
    --enable-baselog)
        core_cpp_flag=$core_cpp_flag' -DBRICKRED_BUILD_ENABLE_BASE_LOG'
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
echo "BR_INSTALL_PREFIX = $opt_prefix" >config.mak
echo "BR_CORE_CPP_FLAG = $core_cpp_flag" >>config.mak