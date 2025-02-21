# ansible-tutorial


### Prerequisites
To be able to run playbooks as sudo without providing the password a file ```~/.vault_key``` is needed that holds the sudo password for the servers.
```
echo "the_super_secret_password" > ~/.vault_key
```
