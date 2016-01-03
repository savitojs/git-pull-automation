/me feels lazy pulling changes everyday
This script has to run inside of directory where all the repositories exists
You can add this script to cron for automatic git pull after certain interval.
cp auto-git-pull.sh /bin/

Cron Example:
*     1       *       *       *       /bin/auto-git-pull.sh /repos 1

For simple usage it can also be used as:
for D in `ls`; do pushd $D; echo "==> DIR ${D}, COMMAND: git pull"; git pull; popd; done
