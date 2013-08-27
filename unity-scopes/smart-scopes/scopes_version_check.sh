#!/bin/sh

version_check() {
	if [ ! -f /tmp/Sources-${URELEASE} ]; then
		echo
		wget http://archive.ubuntu.com/ubuntu/dists/${URELEASE}/main/source/Sources.bz2 -O /tmp/Sources-${URELEASE}.bz2
		bunzip2 /tmp/Sources-${URELEASE}.bz2
	fi
	upstream_version=`grep -A2 "Package: unity-scope-${_name}$" /tmp/Sources-${URELEASE} | sed -n 's/^Version: \(.*\)/\1/p' | sed 's/[0-9]://g'`
 
	if [ -z "${upstream_version}" ]; then
		upstream_version=unity-scope-`wget -q "http://packages.ubuntu.com/${URELEASE}/source/unity-scope-${_name}" -O - | sed -n "s/.*${_name} (\(.*\)).*/${_name}-\1/p" | sed 's/1://g'`
		[ -z ${upstream_version} ] && upstream_version=unity-scope-`wget -q "http://packages.ubuntu.com/${URELEASE}/unity-scope-${_name}" -O - | sed -n "s/.*${_name} (\(.*\)).*/${_name} (\(.*\)).*/${_name}-\1/p" | sed 's/1://g'`
	fi

	if [ "${local_version}" = "${upstream_version}" ]; then
		echo
		echo "  Local version: unity-scope-${_name}-${local_version}  ::  ${URELEASE}"
		echo "  Upstream version: unity-scope-${_name}-${upstream_version}  ::  ${URELEASE}"
	else
		echo
		echo "  Local version: unity-scope-${_name}-${local_version}  ::  ${URELEASE}"
		echo -e "  Upstream version: \033[5m\033[1;31munity-scope-${_name}-${upstream_version}\033[0m  ::  ${URELEASE}"
	fi
}

for ebuild in *.ebuild; do
echo "Checking ${ebuild}"
	source $(pwd)/${ebuild} 2> /dev/null
	for i in ${packages[@]}; do
		unset _rel
		eval "_name=${i}; _ver=\${_ver_${i/-/_}}; _rel=\${_rel_${i/-/_}}"
		if [ ! -z "${_rel}" ]; then
			local_version="${_ver}-${_rel}"
		else
			local_version="${_ver}"
		fi
		version_check
	done
done
