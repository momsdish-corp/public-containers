#!/bin/bash

set -e

# MyDumper
# - Ref https://github.com/mydumper/mydumper/blob/master/docs/mydumper_usage.rst
echo "[mydumper]" > /etc/mydumper.cnf

[[ -n "${MYSQL_HOST}" ]] && \
  echo "host = ${MYSQL_HOST}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PORT}"  ]] && \
  echo "port = ${MYSQL_PORT}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_USER}"  ]] && \
  echo "user = ${MYSQL_USER}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PASSWORD}"  ]] && \
  echo "password = ${MYSQL_PASSWORD}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_DATABASE}"  ]] && \
  echo "database = ${MYSQL_DATABASE}" >> /etc/mydumper.cnf

# The verbosity of messages. 0 = silent, 1 = errors, 2 = warnings, 3 = info. Default is 2.
[[ -n "${VERBOSE}" ]] && \
  echo "verbose = ${VERBOSE}" >> /etc/mydumper.cnf

echo "" >> /etc/mydumper.cnf

# MyLoader Session Variables
echo "[mydumper_session_variables]" >> /etc/mydumper.cnf

[[ -n "${MYDUMPER_SQL_MODE}" ]] && \
  echo "sql_mode = ${MYDUMPER_SQL_MODE}" >> /etc/mydumper.cnf

echo "" >> /etc/mydumper.cnf

# MyLoader
# - Ref https://github.com/mydumper/mydumper/blob/master/docs/myloader_usage.rst
echo "[myloader]" >> /etc/mydumper.cnf

[[ -n "${MYSQL_HOST}" ]] && \
  echo "host = ${MYSQL_HOST}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PORT}"  ]] && \
  echo "port = ${MYSQL_PORT}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_USER}"  ]] && \
  echo "user = ${MYSQL_USER}" >> /etc/mydumper.cnf

[[ -n "${MYSQL_PASSWORD}"  ]] && \
  echo "password = ${MYSQL_PASSWORD}" >> /etc/mydumper.cnf

[[ -n "${QUOTE_CHARACTER}" ]] && \
  echo "quote_character = ${QUOTE_CHARACTER}" >> /etc/mydumper.cnf

echo "" >> /etc/mydumper.cnf

# MyLoader Session Variables
echo "[myloader_session_variables]" >> /etc/mydumper.cnf

[[ -n "${MYLOADER_SQL_MODE}" ]] && \
  echo "sql_mode = ${MYLOADER_SQL_MODE}" >> /etc/mydumper.cnf

echo ""
exec "$@"