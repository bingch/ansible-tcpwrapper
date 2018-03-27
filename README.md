Role Name
=========

Manage tcp wrapper config like sshd/nrpe

Requirements
------------

Need extra ansible augeas library (https://github.com/bingch/ansible-augeas) and augeas/python-augeas packages installed on destination machine 

Role Variables
--------------

service: sshd/nrpe etc.
state: default 'present'
ip: ip address needs to be add in allow ip list.
spawn: string that need to added at the end of service, default '/bin/echo %d from %c \<`/bin/date`\> >> /var/log/wrapper_allow.log ) &' for sshd service

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------
---
- name: Allow jumpbox to ssh to all machines
  hosts: all 
  remote_user: root
  vars:
    jumpboxes:
      - ip: '1.2.3.4'
        host: jumpbox
      - ip: '1.2.3.5'
        host: jumpbox2

  tasks:
    - name: Add jumpboxes to hosts.allow
      include_role: name=tcpwrapper
      vars:
        ip: "{{item.ip}}"
        service: sshd
      with_items: "{{jumpboxes}}"

License
-------

GPL

Author Information
------------------
bingch
