Experiment: Run vTPM as a service on OpenShift (for CI)

```
$ oc logs pod/tpm-5867bbb4ff-sd6qq
-------- Setting up Virtual TPM
Starting vTPM manufacturing as root:root @ Thu 04 Feb 2021 08:18:29 PM UTC
TPM is listening on Unix socket.
Successfully created RSA 2048 EK with handle 0x81010001.
Successfully created NVRAM area 0x1c00004 for RSA 2048 EK template.
  Invoking /usr/share/swtpm/swtpm-localca --type ek --ek 95b4ae480000b56fb25a7883ebd2eb3d7e69de7f35924965fcad7e95041e3d93b510c5dfc76722fc128f67ed7d04aecd8d9849e229f19e9f0f1b21dd2f7cd2365043c56d543
4ac113edd075c4fc9ec6db42940ea99a8ee1cc2802c7e9a1362c294de4d10c63b7de7e83d0d514eb922a5634153af890ac07000c81063f709cc00c7c1e7751f73c86e23999003128370bf08e227d8c052839fec1d994c4f37e1cf47ea63dc3d978f1
091f125e146c9d3db36289e3099b7c75ea94cbc69db6b634ec086a248d1b4c20fa9215b72eaa9cf9b371d5e840920e61bde2798b0f04a733fec01322df40f3922984ff24134076eb1f45d7ece18dada0d556837ef69e3374d --dir /hostroot/tm
p/tpmdir --tpm-spec-family 2.0 --tpm-spec-level 0 --tpm-spec-revision 150 --tpm-manufacturer id:00001014 --tpm-model swtpm --tpm-version id:20170619 --tpm2 --configfile /hostroot/tmp/swtpm-localca
.conf --optsfile /hostroot/tmp/swtpm-localca.options
swtpm-localca: Successfully created EK certificate locally.
  Invoking /usr/share/swtpm/swtpm-localca --type platform --ek 95b4ae480000b56fb25a7883ebd2eb3d7e69de7f35924965fcad7e95041e3d93b510c5dfc76722fc128f67ed7d04aecd8d9849e229f19e9f0f1b21dd2f7cd2365043c
56d5434ac113edd075c4fc9ec6db42940ea99a8ee1cc2802c7e9a1362c294de4d10c63b7de7e83d0d514eb922a5634153af890ac07000c81063f709cc00c7c1e7751f73c86e23999003128370bf08e227d8c052839fec1d994c4f37e1cf47ea63dc3
d978f1091f125e146c9d3db36289e3099b7c75ea94cbc69db6b634ec086a248d1b4c20fa9215b72eaa9cf9b371d5e840920e61bde2798b0f04a733fec01322df40f3922984ff24134076eb1f45d7ece18dada0d556837ef69e3374d --dir /hostr
oot/tmp/tpmdir --tpm-spec-family 2.0 --tpm-spec-level 0 --tpm-spec-revision 150 --tpm-manufacturer id:00001014 --tpm-model swtpm --tpm-version id:20170619 --tpm2 --configfile /hostroot/tmp/swtpm-l
ocalca.conf --optsfile /hostroot/tmp/swtpm-localca.options
swtpm-localca: Successfully created platform certificate locally.
Successfully created NVRAM area 0x1c00002 for RSA 2048 EK certificate.
Successfully created NVRAM area 0x1c08000 for platform certificate.
Successfully created ECC EK with handle 0x81010016.
Successfully created NVRAM area 0x1c00017 for ECC EK template.
  Invoking /usr/share/swtpm/swtpm-localca --type ek --ek x=1e7eaa3cad167fcb7920bfc2df3a9b165c03dc97c7b33206ac2605531d185c49fbc6b436810d45281e9c10f66f39916a,y=1e9b3b0b21265e6d32cc107b5c5b1c1bde8b75
0a01ccc15d66fa7a1daf16720fe2b6f93c58dbdb0d9e3ba254d397c8e6,id=secp384r1 --dir /hostroot/tmp/tpmdir --tpm-spec-family 2.0 --tpm-spec-level 0 --tpm-spec-revision 150 --tpm-manufacturer id:00001014 -
-tpm-model swtpm --tpm-version id:20170619 --tpm2 --configfile /hostroot/tmp/swtpm-localca.conf --optsfile /hostroot/tmp/swtpm-localca.options
swtpm-localca: Successfully created EK certificate locally.
Successfully created NVRAM area 0x1c00016 for ECC EK certificate.
Successfully activated PCR banks sha256,sha1 among sha1,sha256,sha384,sha512.
Successfully authored TPM state.
Ending vTPM manufacturing @ Thu 04 Feb 2021 08:18:30 PM UTC

** (process:23): WARNING **: 20:18:30.186: tcti_conf before: "device:/dev/tpm0"

** (tpm2-abrmd:23): WARNING **: 20:18:30.186: tcti_conf after: "swtpm:"

** (tpm2-abrmd:23): WARNING **: 20:18:30.187: Failed to get proxy for DBus daemon (org.freedesktop.DBus): Cannot autolaunch D-Bus without X11 $DISPLAY

** (tpm2-abrmd:23): CRITICAL **: 20:18:30.188: Failed to acquire DBus name com.intel.tss2.Tabrmd. UID 0 must be allowed to "own" this name. Check DBus config and check that this is running as user
 tss or root.


```
