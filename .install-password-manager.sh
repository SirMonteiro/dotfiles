#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH and is already logged in
type bw >/dev/null 2>&1 && bw login --check && exit

INSTALLATION_DIR=~/.local/bin
TMP_FILE=/tmp/bitwardenCLI.zip

case "$(uname -s)" in
Darwin)
    DOWNLOAD_LINK="https://bitwarden.com/download/?app=cli&platform=macos"
    ;;
Linux)
    DOWNLOAD_LINK="https://bitwarden.com/download/?app=cli&platform=linux"
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac


if command -v curl &> /dev/null; then
  echo "Download Bitwarden CLI using curl"
  curl -sLo $TMP_FILE $DOWNLOAD_LINK
elif command -v wget &> /dev/null; then
  echo "Download Bitwarden CLI using wget"
  wget -qO $TMP_FILE $DOWNLOAD_LINK
else
  echo "Neither curl or wget detected"
fi

echo "Ensure that $INSTALLATION_DIR exists"
mkdir -p $INSTALLATION_DIR

echo "Unzipping bw to $INSTALLATION_DIR"
unzip -q $TMP_FILE -d $INSTALLATION_DIR

echo "Ensure bw bin is executable"
chmod +x $INSTALLATION_DIR/bw

echo "Insert Bitwarden login"
bw login

