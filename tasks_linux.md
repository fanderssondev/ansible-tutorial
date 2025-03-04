# **Server World Portal and CLI Tools**

## **Server World Portal**

Used in my presentation as a source of configuration files:  
🔗 [Server World](https://www.server-world.info/en/)

## **Useful CLI Tools**

- [CLI Tools You Can't Live Without](https://dev.to/lissy93/cli-tools-you-cant-live-without-57f6)
- [Best Command-Line Tools](https://new.pythonforengineers.com/blog/best-command-line-tools-ive-played-with/)

---

# **Tools Used During My Presentation**

## **Services Configured (In Order of Appearance)**

### **1. SSH and SFTP with Chroot Jail**

🔗 [Setup Guide](https://www.server-world.info/en/note?os=Rocky_Linux_8&p=ssh&f=5)

#### **Homework:**

- Configure a chroot jail to the home directory.
- Ensure SSH login to Bash is allowed.

---

### **2. Web Server (Apache)**

🔗 [Setup Guide](https://www.server-world.info/en/note?os=CentOS_Stream_9&p=httpd&f=1)

- Create two websites: `www.example.net` and `www.domain.org` on the same Linux machine.
- Ensure the websites are accessible only when the exact URL is provided.

#### **Homework:**

- Set up the same configuration using **NGINX** instead of Apache.

---

### **3. NFS Storage**

- Create an NFS share and export it to other clients.
- Restrict one client to **read-only** access.
- Configure **ACLs** to allow only specific UID/GID to write to the share.

---

### **4. DNS Configuration**

#### **(i) Configure Dnsmasq (Local Caching DNS Service)**

- Use `/etc/hosts` to ensure the Linux box responds to `nslookup` and `host` queries.  
  🔗 [Setup Guide](https://www.server-world.info/en/note?os=CentOS_Stream_9&p=dnsmasq&f=1)

#### **(ii) Configure BIND DNS Service**

- Remove dnsmasq.
- Configure a zone in `named.conf`.
- Set up proper records in `/var/named/<file>`.
- Create **SOA, NS, and A records**.  
  🔗 [Setup Guide](https://www.server-world.info/en/note?os=CentOS_Stream_9&p=dns&f=2)

---

# **Commands & Tools Used**

```
nslookup
dig
netstat
ip
systemctl
firewall-cmd
setenforce 0|1
ssh-keygen, ssh-copy-id
setfacl
exportfs -ra
```

📌 **REMEMBER**: Use `man <command>` to get additional information.

---

# **Christmas Break Tasks**

## **1. Configure a Linux Machine with Users & Groups**

### **Groups:**

- **developers**
- **testers**

### **Users:**

- **John** → UID: `4000`, GID: `4000`, Groups: `john (4000)`, `users`, `developers`
- **Jane** → UID: `4100`, GID: `4100`, Groups: `users (4100)`, `testers`

📌 **Task:** Exchange SSH keys for these users to enable passwordless login.

---

## **2. Grant Sudo Rights**

- Grant **sudo** access to `john`.
- Research how to do this online (Server World has a tutorial).

---

## **3. Secure SSH Access**

- **Disable root login** in the SSHD service.
- **Configure a chroot jail for all users**, including the **SFTP subsystem**.
- Ensure that **even in chroot jail, system users can still log in to Bash**.

---

## **4. Configure Nginx Web Server**

- Set up **two websites** that only respond to specific URLs (same as Apache configuration).

---

## **5. Configure NFS with Two Shares**

- `/nfs/developers`
- `/nfs/testers`

### **Permissions & Restrictions:**

✅ **Only writable by specific groups**  
✅ **Testers' folder should be accessible from one IP address** (requires a second Linux machine)  
✅ **Root should not have write permissions**  
✅ **Mount the shares on a second machine and test access for `john` and `jane`**  
✅ **Set ACLs if necessary**

---

## **6. Configure DNS Services**

### **(i) Dnsmasq Setup**

- Provide name resolution from `/etc/hosts`.
- Change the domain `pierce.com` to point to `199.199.20.20` (regardless of availability).

### **(ii) BIND DNS Setup**

- Configure a **local domain**: `devops.training`.
- Create **A records** pointing to the Linux machine's IP.
