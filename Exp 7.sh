[root@fedora ~]# sudo iptables -t filter --append INPUT -j DROP

[root@fedora ~]# ping www.google.com

[root@fedora ~]# sudo iptables -t filter --list

[root@fedora ~]# sudo iptables -L --line-number

[root@fedora ~]# sudo iptables -t filter --delete INPUT 2

[root@fedora ~]# sudo iptables -L --line-number

[root@fedora ~]# sudo iptables -t filter --check INPUT -s 192.168.1.123 -j DROP ; echo $?

[root@fedora ~]# sudo iptables -t filter --check INPUT -j DROP ; echo $?

[root@fedora ~]# sudo iptables -t filter -A INPUT -p udp -j DROP

[root@fedora ~]# sudo iptables -t filter --list

[root@fedora ~]# sudo iptables -t filter -A FORWARD -j DROP

[root@fedora ~]# sudo iptables -t filter --list

1.
ping: unknown host www.google.com

2.
Chain INPUT (policy ACCEPT)
target  prot opt source     destination
DROP    all  --  anywhere   anywhere

Chain FORWARD (policy DROP)
target  prot opt source     destination

Chain OUTPUT (policy ACCEPT)
target  prot opt source     destination

3.
Chain INPUT (policy ACCEPT)
num  target   prot opt source       destination
1    DROP     all  --  192.168.1.123 anywhere
2    DROP     all  --  anywhere      anywhere

Chain FORWARD (policy DROP)
num  target   prot opt source       destination

Chain OUTPUT (policy ACCEPT)
num  target   prot opt source       destination

Chain DOCKER-USER (0 references)
num  target   prot opt source       destination

4.
Chain INPUT (policy ACCEPT)
num  target   prot opt source       destination
1    DROP     all  --  thinkpad-e470.lan anywhere

Chain FORWARD (policy DROP)
num  target   prot opt source       destination

Chain OUTPUT (policy ACCEPT)
num  target   prot opt source       destination

Chain DOCKER-USER (0 references)
num  target   prot opt source       destination

5.
0

6.
iptables: Bad rule (does a matching rule exist in that chain?).

7.
Chain INPUT (policy ACCEPT)
target  prot opt source     destination
DROP    udp  --  anywhere   anywhere

Chain FORWARD (policy DROP)
target  prot opt source     destination

Chain OUTPUT (policy ACCEPT)
target  prot opt source     destination

Chain DOCKER-USER (0 references)
target  prot opt source     destination

8.
Chain INPUT (policy ACCEPT)
target  prot opt source     destination
DROP    udp  --  anywhere   anywhere
ACCEPT  all  --  192.168.1.230 anywhere

Chain FORWARD (policy DROP)
target  prot opt source     destination
DROP    all  --  anywhere   anywhere

Chain OUTPUT (policy ACCEPT)
target  prot opt source     destination
DROP    all  --  anywhere   192.168.1.123
