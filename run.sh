#!/usr/bin/bash
# sourced from https://github.com/keylime/rust-keylime/blob/master/tests/run.sh

set -euf -o pipefail

# Hacks to get swtpm-localca to work in the container.
export XDG_CONFIG_HOME=/hostroot/tmp
rm -rf /hostroot/tmp/tpmdir

cat << EOF > /hostroot/tmp/swtpm_setup.conf
# Program invoked for creating certificates
create_certs_tool= /usr/share/swtpm/swtpm-localca
create_certs_tool_config = ${XDG_CONFIG_HOME}/swtpm-localca.conf
create_certs_tool_options = ${XDG_CONFIG_HOME}/swtpm-localca.options
EOF
cat << EOF > /hostroot/tmp/swtpm-localca.conf
statedir = ${XDG_CONFIG_HOME}/var/lib/swtpm-localca
signingkey = ${XDG_CONFIG_HOME}/var/lib/swtpm-localca/signkey.pem
issuercert = ${XDG_CONFIG_HOME}/var/lib/swtpm-localca/issuercert.pem
certserial = ${XDG_CONFIG_HOME}/var/lib/swtpm-localca/certserial
EOF
cat << EOF > /hostroot/tmp/swtpm-localca.options
--platform-manufacturer Fedora
--platform-version 2.12
--platform-model QEMU
EOF
# End local hacks

echo "-------- Setting up Virtual TPM"
mkdir -p /hostroot/tmp/tpmdir
swtpm_setup --tpm2 \
    --tpmstate /hostroot/tmp/tpmdir \
    --createek --allow-signing --decryption --create-ek-cert \
    --create-platform-cert \
    --display
swtpm socket --tpm2 \
    --tpmstate dir=/hostroot/tmp/tpmdir \
    --flags startup-clear \
    --ctrl type=tcp,port=2322 \
    --server type=tcp,port=2321 \
    --daemon
# tpm2-abrmd relies on dBus - not sure if there is a way around this.
tpm2-abrmd \
    --logger=stdout \
    --tcti=swtpm: \
    --allow-root \
    --session \
    --flush-all

# Commenting out below - this is testing related to rust-keylime
#
#echo "-------- Running clippy"
# The cargo denies are currently disabled, because that will require a bunch of dep cleanup
#cargo clippy --all-targets --all-features -- -D clippy::all  # -D clippy::cargo

#echo "-------- Building"
#RUST_BACKTRACE=1 cargo build

#echo "-------- Testing"
#TCTI=tabrmd:bus_type=session RUST_BACKTRACE=1 RUST_LOG=info cargo test -- --nocapture
