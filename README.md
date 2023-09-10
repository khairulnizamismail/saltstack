#Differences version for different releases

All workstations with Ubuntu 18.04 will be installed with Firefox version 89, while the one with 16.04 will
use Firefox version 85 instead. Could you please write an Saltstack SLS file for this and push it to the
workstations.
Note 1: All workstations is under group/grains "node_type" named "workstation".
Note 2: Answer should be in 2 files:
an .sls file --> workstation.sls
saltstack command used to push sls --> workstation_push.txt
