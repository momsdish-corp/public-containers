#!/bin/bash

set -e

# Update config

# Ref https://github.com/mydumper/mydumper/blob/master/docs/mydumper_usage.rst
echo "Configuring mydumper..."
echo "[mydumper]" > /etc/mydumper.cnf

[[ -n "${MYSQL_HOST}" ]] && \
  echo "Adding host = ${MYSQL_HOST}" >> /etc/mydumper.cnf
  echo "host = ${MYSQL_HOST}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PORT}"  ]] && \
  echo "Adding port = ${MYSQL_PORT}" >> /etc/mydumper.cnf
  echo "port = ${MYSQL_PORT}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_USER}"  ]] && \
  echo "Adding user = ${MYSQL_USER}" >> /etc/mydumper.cnf
  echo "user = ${MYSQL_USER}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PASSWORD}"  ]] && \
  echo "Adding password = ***" >> /etc/mydumper.cnf
  echo "password = ${MYSQL_PASSWORD}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_DATABASE}"  ]] && \
  echo "Adding database = ${MYSQL_DATABASE}" >> /etc/mydumper.cnf
  echo "database = ${MYSQL_DATABASE}" >> /etc/mydumper.cnf

# The verbosity of messages. 0 = silent, 1 = errors, 2 = warnings, 3 = info. Default is 2.
[[ -n "${VERBOSE}" ]] && \
  echo "Adding verbose = ${VERBOSE}" >> /etc/mydumper.cnf
  echo "verbose = ${VERBOSE}" >> /etc/mydumper.cnf

echo "" >> /etc/mydumper.cnf

# Ref https://github.com/mydumper/mydumper/blob/master/docs/myloader_usage.rst
echo "Configuring myloader..."
echo "[myloader]" >> /etc/mydumper.cnf  

[[ -n "${MYSQL_HOST}" ]] && \
  echo "Adding host = ${MYSQL_HOST}" >> /etc/mydumper.cnf
  echo "host = ${MYSQL_HOST}" >> /etc/mydumper.cnf  

[[ -n "${MYSQL_PORT}"  ]] && \
  echo "Adding port = ${MYSQL_PORT}" >> /etc/mydumper.cnf
  echo "port = ${MYSQL_PORT}" >> /etc/mydumper.cnf  

[[ -n "${MYSQL_USER}"  ]] && \
  echo "Adding user = ${MYSQL_USER}" >> /etc/mydumper.cnf
  echo "user = ${MYSQL_USER}" >> /etc/mydumper.cnf  

[[ -n "${MYSQL_PASSWORD}"  ]] && \
  echo "Adding password = ***" >> /etc/mydumper.cnf
  echo "password = ${MYSQL_PASSWORD}" >> /etc/mydumper.cnf  

echo ""
exec "$@"