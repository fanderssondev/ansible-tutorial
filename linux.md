What I want you to do during Christmas break:

Configure linux machine with
Groups
i. developers

                                                             ii.      testers

Users
i. John – uid 4000 – gid: 4000 – groups: john (gid=4000), users, developers

                                                             ii.      Jane – uid 4100 – gid: 4100 – group: (users=4100, testers)

Exchange keys for those users so that you can login without password
Make sudo right for user john – please search how in the internet – on the server world there is tutorial how to do that
Configure sshd service so that root login is forbidden
i. Configure chroot jail for all users including sftp subsystem

                                                             ii.      Make sure (as per homework) that even in chroot jail system users will still be able to login to shell (/bin/bash)

Configure webserver with nginx with two websites which will be responsive only for specific url (look above)
|Configure NFS with two shares
i. /nfs/developers and /nfs/testers

                                                             ii.      Make those shares only writeable for specific group

                                                           iii.      Folder testers should be only accessible from one IP address (you need second linux machine for that)

                                                           iv.      Don’t allow root write in the shares

                                                             v.      Mount the shares on second machine test if users john and jane from the second machine can write to allowed folders if necessary set the ACL

Configure dnsmasq and provide name resolution from /etc/hosts file and change domain for pierce.com to point to the ip 199.199.20.20 (we don’t care if its taken or not name resolution should work)
Configure bind with local domain like devops.training and provide records with you linux machines ip as records A types

History of command unfortunately is gone as I had restored the VM from snapshot – but you have all the steps in the presented links above.
