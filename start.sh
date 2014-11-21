#!/bin/sh

SSH_KEY_FILE=/etc/ssh/proxykey

[ "$SSH_KEY" ] || exit 1
[ "$SSH_LOCALPORT" ] || exit 1
[ "$SSH_REMOTEPORT" ] || exit 1
[ "$SSH_TARGET" ] || exit 1

cat > $SSH_KEY_FILE <<EOF
$SSH_KEY
EOF
chmod 400 $SSH_KEY_FILE

exec /usr/bin/ssh -i $SSH_KEY_FILE \
	-o BatchMode=yes \
	-o StrictHostkeyChecking=no \
	-Nn -R $SSH_REMOTEPORT:localhost:$SSH_LOCALPORT $SSH_TARGET

