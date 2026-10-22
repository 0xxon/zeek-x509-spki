# @TEST-EXEC: zeek -r $TRACES/tls1.2.pcap $PACKAGE
#
# @TEST-EXEC: zeek-cut -m fingerprint certificate.version certificate.serial certificate.subject certificate.issuer spki < x509.log > x509.cut
# @TEST-EXEC: btest-diff x509.cut
