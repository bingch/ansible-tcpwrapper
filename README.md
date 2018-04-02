Role Name
=========

Manage tcp wrapper config like sshd/nrpe

Requirements
------------

Need extra ansible augeas library (https://github.com/bingch/ansible-augeas) and augeas/python-augeas packages installed on destination machine 

Role Variables
--------------

<pre>
# defaults file for tcpwrapper
spawn: '(/bin/echo %d from %c \<`/bin/date`\> >> /var/log/wrapper_allow.log) &'
state: 'present'
service: 'sshd'
host_list: []                         # host to be added to or del from service
ansible_control_host: '192.168.122.1' # set to your actual ip
hostsdeny: 'ALL:ALL'                   
set_hostsdeny: false                  # be careful to make sure control machine is in
                                      # sshd allow list before set to true
</pre>
Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------
---
- hosts: 192.168.122.2
  remote_user: root
  tasks:
    - name: add sshd hosts
      include_role:
        name: tcpwrapper
      vars:
        host_list:
          - "{{ ansible_control_host }}"
          - bart-wrks
        service: sshd
        state: present

    - name: add nrpe host
      include_role:
        name: tcpwrapper
      vars:
        host_list:
          - "{{ ansible_control_host }}"
          - bart-wrks
          - joe-wrks
        service: nrpe
        state: present

    - name: remove bart from sshd
      include_role:
        name: tcpwrapper
      vars:
        host_list:
          - bart-wrks
        service: sshd
        state: absent

License
-------

GPL

Author Information
------------------
bingch
