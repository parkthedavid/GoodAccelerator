#GoodAccelerator

The GoodAccelerator is tooling to accelerate the developrment of projects aligned with the services reference architecture

## Notes
1. Cloud Connect's workspace fodler is assumed to be in the user's Documents folder
2. The script scn be run from any location


## Functionality
1. Run the script with the command ruby GoodAccelerator.rb
2. The script will ask you the name of the project
3. The script will provide you will a set of options for automating the setup of the project 


## Options
1. Create Reference Architecture Folder Structure for Cloud Connect Graphs
- This creates the folder structure for graphs under the /graph folder

2. Create Referenec Architecture Folder Strucgture for SQL Scripts
- This creates the folder structure for sql scripts under the /sql folder

3. Create sql statements
- This creates the (empty) sql files with the correct naming and location based on the type and source of file, as specifid in the file.csv
- you need to run option 2 before you can run this

4. Create Graphs
- This creates the (empty, except for SFDC source files) graph files with the correct naming and location based on the type and source of file, as specifid in the file.csv
- you need to run option 1 before you can run this


To request changes / enhancements, up add them to the gdoc below
https://docs.google.com/a/gooddata.com/spreadsheets/d/1a8-f5u7k7fkYsRp1GTOczViypqc-8WK88XmhWIbJDvQ/edit?usp=sharing