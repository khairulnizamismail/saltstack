#top.sls

base:
  'host:workstation*':
    - match: grain
    - workstation




#workstation.sls

#defiend OS
{% set apvar = salt['grains.filter_by'] ( {
  'Ubuntu': {'osver': 'ubuntu-14.04', 'pkgend': 'deb', 'pkginst': 'dpkg -i'},
  'Ubuntu': {'osver': 'ubuntu-18.04', 'pkgend': 'deb', 'pkginst': 'dpkg -i'},
}, default = 'Ubuntu') %}


app:
  file.managed:
    - name: /home/nizam/workstation-{{ apvar.osver }}-x86_64.tar.gz
    - source: salt://sw/workstation-{{ apvar.osver }}-x86_64.tar.gz

  cmd.run:
    - name: "cd /home/nizam; tar xvzf /home/nizam/workstation-{{ apvar.osver }}-x86_64.tar.gz; {{apvar.pkginst }} /home/nizam/workstation/*.{{ apvar.pkgend }}"
    - creates: /usr/local/sbin/app
