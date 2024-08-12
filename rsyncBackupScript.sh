#!/bin/bash

SOURCE_DIR='/home/az/'
DESTINATION_DIR='/mnt/Backup/'
RSYNC_COMMAND="rsync -av --progress --exclude='/.*' --exclude='lost+found' ${SOURCE_DIR} ${DESTINATION_DIR}"
RSYNC_COMMAND_DRY_RUN="$RSYNC_COMMAND --dry-run"
RSYNC_COMMAND_WITH_DELETE="$RSYNC_COMMAND --delete"

# Prompt the user to confirm
konsole -e bash -c "
echo '${RSYNC_COMMAND_DRY_RUN}'
echo
$RSYNC_COMMAND_DRY_RUN
echo
echo '----------------------------------------------------------------------------------------'
echo
echo 'Type y or Y to run the following command.'
echo 'Type delete to add the --delete option.'
echo 'Or press Enter to skip.'
echo
echo '${RSYNC_COMMAND}'
echo
echo -n 'Do you want to execute the command? (y/N): '
read answer
if [ \"\$answer\" = \"y\" ] || [ \"\$answer\" = \"Y\" ]; then
    clear
    echo '${RSYNC_COMMAND}'
    sudo $RSYNC_COMMAND
elif [ \"\$answer\" = \"delete\" ]; then
    clear
    echo '${RSYNC_COMMAND_WITH_DELETE}'
    sudo $RSYNC_COMMAND_WITH_DELETE
else
    echo
    echo 'Backup skipped.'
fi;
echo
echo 'press any key to close the terminal.'
read
"
