#!/bin/sh
auto_envsubst() {
  local output_dir="/etc/nginx"
  local filter="${NGINX_ENVSUBST_FILTER:-}"
  defined_envs=$(printf '${%s} ' $(awk "END { for (name in ENVIRON) { print ( name ~ /${filter}/ ) ? name : \"\" } }" < /dev/null ))
  for i in ${PRINTER//,/ }
  do
      export HOSTNAME=$( echo "$i" |cut -d'.' -f1 )
      export FQDN=$i
      envsubst '$HOSTNAME' < $output_dir/location.tmpl > $output_dir/location.d/$HOSTNAME.conf
      envsubst '$FQDN,$HOSTNAME' < $output_dir/upstream.tmpl > $output_dir/conf.d/$FQDN.conf
  done
}
auto_envsubst
