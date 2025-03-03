#!/bin/bash

set -e

# MyDumper

# - Ref https://github.com/mydumper/mydumper/blob/master/docs/mydumper_usage.rst
echo "[mydumper]" > /etc/mydumper.cnf

[[ -n "${MYSQL_HOST}" ]] && \
  echo "host = ${MYSQL_HOST:-mysql}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PORT}"  ]] && \
  echo "port = ${MYSQL_PORT:-3306}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_USER}"  ]] && \
  echo "user = ${MYSQL_USER:-root}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PASSWORD}"  ]] && \
  echo "password = ${MYSQL_PASSWORD:-password}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_DATABASE}"  ]] && \
  echo "database = ${MYSQL_DATABASE:-wordpress}" >> /etc/mydumper.cnf

# The verbosity of messages. 0 = silent, 1 = errors, 2 = warnings, 3 = info. Default is 2.
[[ -n "${VERBOSE}" ]] && \
  echo "verbose = ${VERBOSE}" >> /etc/mydumper.cnf

echo "" >> /etc/mydumper.cnf

# MyLoader
# - Ref https://github.com/mydumper/mydumper/blob/master/docs/myloader_usage.rst
echo "[myloader]" >> /etc/mydumper.cnf

[[ -n "${MYSQL_HOST}" ]] && \
  echo "host = ${MYSQL_HOST:-mysql}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PORT}"  ]] && \
  echo "port = ${MYSQL_PORT:-3306}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_USER}"  ]] && \
  echo "user = ${MYSQL_USER:-root}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PASSWORD}"  ]] && \
  echo "password = ${MYSQL_PASSWORD}" >> /etc/mydumper.cnf

echo ""
exec "$@"