* Minimal Debian preseed script.
* Minimal shell script to automatically build a VM in VirtualBox.

* Works best with a local Debian mirror cache.
* Using DHCP + mDNS for simplicity
* This is not a substitute for Vagrant.

Instructions
------------
Serve this stuff via <code> python -m SimpleHTTPServer 8080 </code> from the CWD

Instructions
<code>./build-vm.sh some-server </code>

<blockquote>
Debian boot screen -> Automated install
Enter preseed URL: (eg http://192.168.0.100:8080/preseed.cfg)
</blockquote>
