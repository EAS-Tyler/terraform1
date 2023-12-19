# First Apache server, using ansible to configure VMs

- Here I created an ansible playbook to configure a VM to run an apache server


- I first created a VM template in vSphere including my public ssh key, to speed up my attempts

- I then earned about yaml format - human-readable (and typically a) configuration file, that relies on spacing/indentation - which I wrote my playboook in 

- The ansible playbook I wrote included a hosts group, and variables group (to configure the playbook) along with a list of tasks/plays to carry out on the servers. 
    - Playbook - list of "plays" in an ordered list
    - Touched on the idea of "roles"

- Created an inventory file (INI format - installation/configuration file, text based dictating how a program shoud operate) including the servers (group) of focus

- Created a template configuration file, with use of variables, which were stored in a separate file (variables). This makes the config file reusable, and allows it to be applies to different groups of servers efficiently

- Learned about communicating with VM through ansible ssh
    - Testing connectivity with ping
- ansible & ansible-playbook commands

\* Typically, I would not commit the inventory file to git, as I would not want to share any private server numbers, usernames pr passwords - but as this was a test run for my learning, I have uploaded it