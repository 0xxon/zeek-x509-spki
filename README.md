X509 SPKI Logging
=================

This [Zeek](https://zeek.org/) package adds the hash of the Subject Public Key Info (SPKI)
of each certificate to x509.log.

The SPKI of a X509 certificate is the datastructure that contains the public key, and algorithm information
of a certificate. It thus uniquely identifies the key that is used by a certificate.

The SPKI hash is commonly used to blacklist certificates; it is, for example, used by Chrome in
[CRLSets](https://www.chromium.org/Home/chromium-security/crlsets/) to block Certificates.

It typically is a good idea to use SPKIs instead of, e.g., certificate fingerprints when trying
to block or identify a certificate. This is especially true for intermediate CA certificates
where cross-signed certificates often exist - so certificates chaining to different parent CAs
that use the same key material.

By default an SHA256 hash is used; this can be configured by changing ``X509SPKI::hash_alg``.
