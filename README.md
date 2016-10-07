# Ansible and Prometheus Playground

Using Ansible install Prometheus and Grafana. Just for fun and learn.

## Prerequisites

* [Vagrant]([https://www.vagrantup.com/) [ Version: 1.8.1 ]
* [VirtualBox](https://www.virtualbox.org/) [ Version: 5.0.22 ]

*NOITE* Work in progress :)

## Getting Started

* Launch a Vagrant Box and setup Grafana and Prometheus

  ```
  ./test_playbook.sh monitor
  ```


* Once Ansible playbook completes, Head over *http://192.168.90.90:3000*.
  Default credentials are admin / admin


* Click on the top right, in the Grafana Menu and go to Datasources. There Click
on *Add data source*

![Grafana Menu](/images/grafana_menu.png)
![Grafana DataSources](/images/add_datasource.png)


* Fill Data Source information as described in the following image

![DataSource Config](/images/datasource_config.png)


* Download the following pre build dashboards

  - https://grafana.net/dashboards/405
  - https://grafana.net/dashboards/22
  - https://grafana.net/dashboards/2


* Import it in Dashboard Section. Don't forget to select *prometheus* ad the data source. Repeat this steop for every dashboard you want to import

![Import Dashboard](/images/import_dashboard.png)
![Save Dashboard](/images/save_dashboard.png)


Enjoy playing around :)

![Dashboard](/images/dashboard.png)
