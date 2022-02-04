#!/usr/bin/env bash

export CODEPATH=/opt/code/code-server
export CODEBIN=$CODEPATH/bin
export CODELIB=$CODEPATH/lib

export PATH=$PATH:$CODEBIN:$CODELIB

NODE_VER=$(echo ${NODE_VERSION} | awk -F. '{print $1}')
cp /opt/code/node_env.${NODE_VER} /root/.bashrc.node
echo 'source /root/.bashrc.node' >> /root/.bashrc

cp -rf /opt/code/tools/nc /usr/local/bin/
cp -rf /opt/code/tools/socat/socat /usr/local/bin/
cp -rf /opt/code/tools/socat/*.so.0 /usr/lib/x86_64-linux-gnu/

#PASSWORD=123123 node /opt/code/code-server --host 0.0.0.0
PASSWORD=123123 /opt/code/code-server/bin/code-server --host 0.0.0.0

#tail -f /dev/null
#sleep infinity

