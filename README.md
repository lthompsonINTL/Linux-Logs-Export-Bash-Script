As an IT professional, I’ve learned the importance of log files when troubleshooting issues. There are times when logs can be lost due to system issues, logs rolling over or other circumstances.  Before logs could be lost due to unforeseen events, if logs could be automatically sent to another machine on the network, this would securely save the files and save time for employees. 

The exportlogprg.sh program I wrote does the following:

-Copies specified log files from /var/log and copies them into a newly created folder for exporting log files

-Places the copied log files into a zip file. The zip file is timestamped with the current time and date written into the file name during its creation

-The zip file with its current date and time is then sent to another server on the network for safe and secure storage

If this shell script is configured to run as a cron job, the collection of specific log files on an hourly/nightly/weekly basis, from one or more servers is completely automated. This application is completely Cloud service agnostic, as long as Linux is the primary OS of the instances in use. 

This application was NOT written by AI. I did use Copilot to troubleshoot various error messages. 
 
