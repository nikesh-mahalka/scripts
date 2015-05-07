Work around:
--------------------------------------------------
1.command 10
"bash install_master.sh < /tmp/install_master.in" is not working out now,so currently we have to manually enter git uri
create your own git uri and make changes in vars.sh and yaml of /etc/nodepool/ of your git repo
Take https://github.com/nikesh-mahalka/os-ext-testing-data2 as sample repo.

2.command 12
Manual setup of Jenkins scp 1.9 plugin - do this with jenkins dashboard
3.last two commands not needed.
