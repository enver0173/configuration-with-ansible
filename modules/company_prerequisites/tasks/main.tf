- name: create a repo
  copy:
    src: r1soft.repo
    dest: /etc/yum.repos.d/r1soft.repo

- name: Install R1soft
  package:
    name: serverbackup-enterprise-agent
    state: latest
  notify: R1soft RESTART
    
- name: Power off iptables
  systemd:
    name: firewalld
    state: stopped
    ignore_errors: true

    - name: get key
      shell: r1soft-setup --get-key http://backup.enverguner.com