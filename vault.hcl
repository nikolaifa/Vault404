backend "file" {
	address	= "127.0.0.1:8500"
	path	= "/opt/vaultData"	
}
listener "tcp" {
	address		= "127.0.0.1:8200"
 	tls_disable	= 1
}
ui = true
