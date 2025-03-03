#!/bin/bash

set -e

# MyDumper
# - Ref https://github.com/mydumper/mydumper/blob/master/docs/mydumper_usage.rst
echo "Configuring mydumper..."
echo "[mydumper]" > /etc/mydumper.cnf

MYSQL_HOST="${MYSQL_HOST:-mysql}" && \
  echo "Adding host = ${MYSQL_HOST}" && \
  echo "host = ${MYSQL_HOST}" >> /etc/mydumper.cnf

MYSQL_PORT="${MYSQL_PORT:-3306}" && \
  echo "Adding port = ${MYSQL_PORT}" && \
  echo "port = ${MYSQL_PORT}" >> /etc/mydumper.cnf

MYSQL_USER="${MYSQL_USER:-root}" && \
  echo "Adding user = ${MYSQL_USER}" && \
  echo "user = ${MYSQL_USER}" >> /etc/mydumper.cnf

MYSQL_PASSWORD="${MYSQL_PASSWORD:-password}" && \
  echo "Adding password = ***" && \
  echo "password = ${MYSQL_PASSWORD}" >> /etc/mydumper.cnf

MYSQL_DATABASE="${MYSQL_DATABASE:-wordpress}" && \
  echo "Adding database = ${MYSQL_DATABASE}" && \
  echo "database = ${MYSQL_DATABASE}" >> /etc/mydumper.cnf

# The verbosity of messages. 0 = silent, 1 = errors, 2 = warnings, 3 = info. Default is 2.
[[ -n "${VERBOSE}" ]] && \
  echo "Adding verbose = ${VERBOSE}" && \
  echo "verbose = ${VERBOSE}" >> /etc/mydumper.cnf

echo "" >> /etc/mydumper.cnf

# MyLoader
# - Ref https://github.com/mydumper/mydumper/blob/master/docs/myloader_usage.rst
echo "Configuring myloader..."
echo "[myloader]" >> /etc/mydumper.cnf

  echo "Adding host = ${MYSQL_HOST}" && \
  echo "host = ${MYSQL_HOST}" >> /etc/mydumper.cnf

  echo "Adding port = ${MYSQL_PORT}" && \
  echo "port = ${MYSQL_PORT}" >> /etc/mydumper.cnf

  echo "Adding user = ${MYSQL_USER}" && \
  echo "user = ${MYSQL_USER}" >> /etc/mydumper.cnf

  echo "Adding password = ***" && \
  echo "password = ${MYSQL_PASSWORD}" >> /etc/mydumper.cnf

echo ""
exec "$@"