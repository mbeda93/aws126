Q1

The import blocks were important because we were making terraform aware of the existing infrastructure that has been previously set up thru the webui. terraform basically just looks at whats in aws for every import block thats written in the code, and then updates its internal config. if a project is being started from scratch, no imports will be needed

Q2

The tfstate file stores everything in plaintext, and should not be used to manage secrets. if it accidentally gets committed thru git, the secrets would be exposed to the public and no longer be secure. a few reasonable circumstances of using tf to manage secrets are 
* using an encrypted remote backend (with strict iam) 
* aws secrets manager (tf only stores a reference)
* non production environments (testing, devcontainer)