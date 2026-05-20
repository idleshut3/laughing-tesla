# HAProxy Project

---

This was a project I did in the summer of 2025. I was looking for a solution to load balance ingress SSL-VPN connections between 2 Fortigate firewalls, and ended up building this as a proof of concept. At the time, this project was well outside of my comfort zone, and I really enjoyed learning about these concepts.

Initially I started out using a single HAProxy node to load balance the traffic, but quickly realized that a single point of failure can defeat the entire point of load balancing. I implemented Keepalived to make the setup more resistant to failure. The end result was a 2 node active-passive HAProxy configuration, utilizing a floating Virtual IP (via Keepalived) between them, and ingress VPN connections load balanced between the 2 firewalls. 

---

Once load balancing was achieved, I also had to configure the firewalls and internal network such that a user could connect to either firewall, login to the VPN portal, and access the same resources regardless of which firewall HAProxy directed them to. This introduced a number of challenges as well. Unfortunately, I don't have config files for the internal network design, but it taught me a lot about routing via P2P links between firewalls, NAT, and ACLs. 

---

It's been about a year since I last looked at any of my work for this project, but I'd like to get back to it. When I started it, I wasn't sure if it was even possible, so the work here was a PoC more than anything. If I'm able to continue with it, I'd really like to work on the security aspect by adding certs, chroot jail for HAProxy, and more. I'd also like to get deeper into the kernel tuning aspect for high traffic support. Although I see a ton of areas for improvement now, I'm quite happy with how the project went. It taught me a ton about network design, configuration, and troubleshooting. 
