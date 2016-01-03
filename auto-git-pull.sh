#!/bin/bash
# /me feels lazy pulling changes everyday
# Written by Savitoj Singh (savitojs@gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


# This script has to run inside of directory where all the repositories exists
# You can add this script to cron for automatic git pull after certain interval.
# cp auto-git-pull.sh /bin/

# Cron Example:
# *	1	*	*	*	/bin/auto-git-pull.sh /repos 1

usage()
{
echo -e "\nEXAMPLE:"
echo -e "./auto-git-pull.sh <path/to/repos> <max-depth>"
echo -e "./auto-git-pull.sh /repos 1\n"
}

die () {
    echo -e >&2 "$@"
    exit 1
}

[ "$#" -eq 2 ] || die "2 argument required, $# provided"|usage

echo $2 | grep -E -q '^[0-9]+$' || die "Numeric argument required, $2 provided for \$2\n"

for D in `find $1 -maxdepth $2 -type d`; do pushd $D; echo "==> DIR ${D}, COMMAND: git pull"; git pull; popd; done

# For simple usage it can also be used as:
# for D in `ls`; do pushd $D; echo "==> DIR ${D}, COMMAND: git pull"; git pull; popd; done

