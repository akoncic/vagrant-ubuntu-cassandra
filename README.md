About
=====
This repository contains a template [Vagrantfile][vagrantfile] for creating new multi-node [Cassandra][cassandra] database cluster. As a result, you will have 64-bit [Ubuntu][ubuntu] 16.04 (Xenial Xerus) virtual machines running your own multi-node Cassandra database cluster.

Getting Started
===============
Install [VirtualBox][virtualbox] (> 5.1.22), [Vagrant][vagrant] (> 1.9.5), clone this repository and execute `vagrant up`.

Default Setup
=============
By default, **3** Cassandra nodes will be created. Node details are as follow:

| Name | IP | RAM (MB) | CPUs | CPU Cap (%) |
| :---: | :---: | :---: | :---: | :---: |
| cassandra-01 | 10.10.10.31 | 1024 | 1 | 50 |
| cassandra-02 | 10.10.10.32 | 1024 | 1 | 50 |
| cassandra-03 | 10.10.10.33 | 1024 | 1 | 50 |

Custom Setup
============
You can override default configuration with your own `config.rb` file. See `config.rb.sample` form more information.

Default configuration assumes maximum number of 3 instances. If you want to create more instances, you will need to manually create `cassandra.yaml` configuration file for each new instance.

[vagrantfile]: https://www.vagrantup.com/docs/vagrantfile/
[cassandra]: http://cassandra.apache.org/
[ubuntu]: https://atlas.hashicorp.com/ubuntu/boxes/xenial64
[virtualbox]: https://www.virtualbox.org/
[vagrant]: https://www.vagrantup.com/
