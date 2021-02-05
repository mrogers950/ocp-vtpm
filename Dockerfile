FROM fedora:latest

RUN dnf install -y \
	tpm2-tss-devel tpm2-abrmd tpm2-tools \
	swtpm swtpm-tools \
	rust clippy cargo \
	llvm llvm-devel clang pkg-config \
	dbus-daemon && dnf clean all -y

COPY run.sh /run.sh
ENTRYPOINT /run.sh
