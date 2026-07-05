### Ansible Project

This was a project I did in the Winter of 2025. The name is a bit misleading, as it was 2 part project. 

The project initially started out with the goal of writing a bash script which would detect inactivity on a Linux workstation, and shut it down if it met certain idle conditions. The conditions selected were a lack of mouse activity, and a low average CPU usage. The CPU condition was added later to prevent a machine from being shutdown in the middle of a long operation, such as password cracking or digital forensics image ingestion. 

Honestly, I wish I kept better records of the whole process. I remember that I couldn't get a standard cron job to work for the task, probably due to my own lack of experience at the time. Ultimately I ended up writing this bash script that used dd to track mouse movement, and wrote a systemd unit file to go along with it. 

Like most of my older projects, I probably would have done things differently if I were to rewrite it today. I doubt it's the most efficient or secure way of achieving the goal. But it worked, and it taught me a ton about Linux and bash scripting.

The second half of the project emerged after the script stuff was sorted out. The goal was to distribute the script to a large number of Linux workstations, and to automate the process. This was my first introduction to working with Ansible, which is now one of my favorite tools to work with. This also really sparked my passion for automation, and later IaC. 

