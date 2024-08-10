#!/bin/bash

SOURCE_DIR='/mnt/Data/'
DESTINATION_DIR='/mnt/DataBackup/'
RSYNC_COMMAND="rsync -av --progress --delete --exclude='/.*' --exclude='lost+found' ${SOURCE_DIR} ${DESTINATION_DIR}"
RSYNC_COMMAND_DRY_RUN="$RSYNC_COMMAND --dry-run"

# Prompt the user to confirm
konsole -e bash -c "
echo '${RSYNC_COMMAND_DRY_RUN}'
echo
$RSYNC_COMMAND_DRY_RUN
echo
echo '${RSYNC_COMMAND}'
echo
echo -n 'Do you want to execute the command? (y/N): '
read answer
if [ \"\$answer\" = \"y\" ] || [ \"\$answer\" = \"Y\" ]; then
    clear
    sudo $RSYNC_COMMAND
else
    echo
    echo 'Backup skipped.'
fi;
echo
echo 'press any key to close the terminal.'
read
"
