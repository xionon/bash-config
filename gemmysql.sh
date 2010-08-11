#!/bin/bash
export ARCHFLAGS="-arch x86_64"; gem install mysql -- --with-mysql-dir=/usr/local/mysql --with-mysql-config=/usr/local/mysql/bin/mysql_config
