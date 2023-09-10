#top.sls
base:
  '*':
    - common

  'node_type:workstation':
   - match: grain
   - firefox
   
   
   
#workstation.sls
{% set conf = salt['grains.filter_by']({
  'Ubuntu18':  {
    'source': 'salt://sw/firefox-89.0.tar.gz',
    'use_path': '/etc/app',
	},
  'Ubuntu16': {
    'source': 'salt://sw/firefox-85.0.tar.gz',
    'use_path': '/etc/app',
	},
}, grain='os_family', merge=salt['pillar.get']('firefox:lookup')) %}
