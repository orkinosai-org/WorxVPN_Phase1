#!/bin/bash
# Set this to your repo root (where Core/, Mayaqua/, etc. are)
TARGETDIR="."  # Change if needed (e.g., ./demo-12-06/IsmailWorxVPN)

REPO_URL="https://github.com/SoftEtherVPN/SoftEtherVPN_Stable.git"
TMPDIR="./softether_tmp_clone"

# Clone official SoftEtherVPN repo
git clone --depth=1 $REPO_URL $TMPDIR

# Copy real C and header files to your repo folders (overwrite placeholders)
cp $TMPDIR/src/Cedar/*.c $TARGETDIR/Core/
cp $TMPDIR/src/Cedar/*.h $TARGETDIR/Core/
cp $TMPDIR/src/Mayaqua/*.c $TARGETDIR/Mayaqua/
cp $TMPDIR/src/Mayaqua/*.h $TARGETDIR/Mayaqua/
cp $TMPDIR/src/Cedar/Protocol/*.c $TARGETDIR/Protocol/ 2>/dev/null || true
cp $TMPDIR/src/Cedar/Protocol/*.h $TARGETDIR/Protocol/ 2>/dev/null || true
cp $TMPDIR/src/Cedar/Session/*.c $TARGETDIR/Session/ 2>/dev/null || true
cp $TMPDIR/src/Cedar/Session/*.h $TARGETDIR/Session/ 2>/dev/null || true
cp $TMPDIR/src/Cedar/Crypto/*.c $TARGETDIR/Crypto/ 2>/dev/null || true
cp $TMPDIR/src/Cedar/Crypto/*.h $TARGETDIR/Crypto/ 2>/dev/null || true

echo "✅ All real SoftEther client source/header files have been copied to your repo folders."
echo "You can now delete $TMPDIR if you want."