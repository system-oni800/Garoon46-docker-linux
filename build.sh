#/bin/sh
echo "[STEP-01] Preparing docker build.."
date
GAROON_VERSION=4.6.0
GAROON_URL=http://download.cybozu.co.jp/cbgrn/grn-${GAROON_VERSION}-linux-x64.bin #2018/05/06
echo Using stack: ${GAROON_URL}
wget -O garoon-linux-x64.bin ${GAROON_URL}
wget http://download.cybozu.co.jp/cbgrn/grn-4.6-sp3-linux.bin
wget -O grn463-patch.tar https://kb.cybozu.support/wp-content/uploads/2018/09/Garoon20180910Patch-4_6-sp3.tar
tar xvf grn463-patch.tar
mv ./Garoon20180910Patch-4_6-sp3/code/include/fw/session_handler.csp .
#
echo "[STEP-02] Execute to build a docker image"
date
docker build --no-cache=true --rm -t centos7:grn460 .
date
#
echo "[STEP-03] Erase Groon Binary.."
rm -f garoon-linux-x64.bin
date
exit
