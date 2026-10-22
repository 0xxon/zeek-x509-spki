##! Adds the Subject Public Key Info (SPKI) hash of certificates to x509.log

@load base/files/x509

module X509SPKI;

export {
	## Hash algorithm to use for the SPKI hash. Default is SHA256.
	## Please use one of the numbers from https://www.iana.org/assignments/tls-parameters#tls-parameters-18
	option hash_alg: count = 4;
}

redef record X509::Info += {
	## Subject Public Key Info (SPKI) hash of the certificate.
	spki: string &log &optional;
};

event x509_certificate(f: fa_file, cert_ref: opaque of x509, cert: X509::Certificate) &priority=4
	{
	if ( ! f$info?$x509 )
		return;

	f$info$x509$spki = bytestring_to_hexstr(x509_spki_hash(cert_ref, X509SPKI::hash_alg));
	}
