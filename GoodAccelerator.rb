##Program Starting Up
	require 'fileutils';
	require 'csv';
	puts 'Cloud Connect Reference Architecture GoodAccelerator Starting Up';

##Gets the project Name
	puts 'what is the name of your project?'
	projectName = gets.chomp;
	#projectName = 'test';
	workspacePath = 'Documents/workspace';
	projectPath = workspacePath + '/' + projectName;
	puts 'this is the full path of your project =>' + projectPath;

## Moves working directory to the project folder
	#puts 'directory where script is run from =>' + Dir.pwd;
	#Dir.chdir;
	#puts 'root directory => ' + Dir.pwd;
	#Dir.chdir(projectPath);
	#puts 'project directory =>' +  Dir.pwd;


puts 'What would you like to do?
      1. Create Reference Architecture Folder Structure for Cloud Connect Graphs
      2. Create Referenec Architecture Folder Strucgture for SQL Scripts
      3. Create sql statements
      4. Create Graphs'

 selection = gets.chomp;

 case selection
 when "1"

 	Dir.chdir;
	#puts 'root directory => ' + Dir.pwd;
	Dir.chdir(projectPath);
	#puts 'project directory =>' +  Dir.pwd;

	srcCCFolder =  'graph/src';
	tempCCFolder = 'graph/temp';
	stgCCFolder = 'graph/stg';
	dwCCFolder = 'graph/dw';
	dmCCFolder = 'graph/dm';
	prjCCFolder = 'graph/prj';

	Dir.mkdir srcCCFolder unless File.exists? srcCCFolder;
	Dir.mkdir tempCCFolder unless File.exists? tempCCFolder;
	Dir.mkdir stgCCFolder unless File.exists? stgCCFolder;
	Dir.mkdir dwCCFolder unless File.exists? dwCCFolder;
	Dir.mkdir dmCCFolder unless File.exists? dmCCFolder;
	Dir.mkdir prjCCFolder unless File.exists? prjCCFolder;

	puts 'Cloud Connect Graph folder structure created sucessfully.'
 when "2"
 	
 	Dir.chdir;
	#puts 'root directory => ' + Dir.pwd;
	Dir.chdir(projectPath);
	#puts 'project directory =>' +  Dir.pwd;

 	SQLFolder = 'sql';
 	srcSQLFolder =  'sql/src';
	tempSQLFolder = 'sql/temp';
	stgSQLFolder = 'sql/stg';
	dwSQLFolder = 'sql/dw';
	dmSQLFolder = 'sql/dm';
	prjSQLFolder = 'sql/prj';


	Dir.mkdir SQLFolder unless File.exists? SQLFolder;
	Dir.mkdir srcSQLFolder unless File.exists? srcSQLFolder;
	Dir.mkdir tempSQLFolder unless File.exists? tempSQLFolder;
	Dir.mkdir stgSQLFolder unless File.exists? stgSQLFolder;
	Dir.mkdir dwSQLFolder unless File.exists? dwSQLFolder;
	Dir.mkdir dmSQLFolder unless File.exists? dmSQLFolder;
	Dir.mkdir prjSQLFolder unless File.exists? prjSQLFolder;

	puts 'SQL folder structure created sucessfully.'

 when "3"

 	files = CSV.read('files.csv', headers:true);
 	Dir.chdir;
		#puts 'root directory => ' + Dir.pwd;
	Dir.chdir(projectPath);
		#puts 'project directory =>' +  Dir.pwd;

  	# Determine the distinct sources and creates folders
  	uniqueSources = files['source'].uniq;
  	puts uniqueSources
	srcCCFolder =  'graph/src';

  	uniqueSources.each { |x| 
  		srcssCCFolder = srcCCFolder + '/' + x 
  		puts srcssCCFolder;
  		Dir.mkdir srcssCCFolder  unless File.exists? srcssCCFolder 
  		};

  	# creates sql files

  	files.each do |files|
  		p files #<CSV::Row "Name:"Dan"...
  		srcSQLFile = 'src_' + files['source'] + '_' + files['file_name'] + '_truncate_reload' + '.sql';
  			puts srcSQLFile;
  		tempSQLFile = 'temp_' + files['source'] +  '_' + files['file_name'] + '_cdc' + '.sql';
  			puts tempSQLFile;
  		stgSQLFile = 'stg_' + files['source'] + '_' + files['file_name'] + '_merge' + '.sql';
  			puts stgSQLFile;

  		puts 'project directory =>' +  Dir.pwd;
		File.new('sql/src/' + srcSQLFile,'w');
		File.new('sql/temp/' + tempSQLFile,'w');
		File.new('sql/stg/'  + stgSQLFile,'w');
	end
when "4"

	files = CSV.read('files.csv', headers:true);
 	Dir.chdir;
		#puts 'root directory => ' + Dir.pwd;
	Dir.chdir(projectPath);
		#puts 'project directory =>' +  Dir.pwd;

		files.each do |files|
  		p files #<CSV::Row "Name:"Dan"...

  		srcGrfFilePath = 'graph/src/' + files['source'] +'/' ;
  		tempGrfFilePath = 'graph/temp/';
  		stgGrfFilePath = 'graph/stg/';
  		whGrfFilePath = 'graph/dw/';

  		srcGrfFileName = 'src_' + files['source'] + '_' + files['file_name'] + '.grf';
  		tempGrfFileName = 'tmp_' + files['source'] + '_' + files['file_name'] + '.grf';
  		stgGrfFileName = 'stg_' + files['source'] + '_' + files['file_name'] + '.grf';
  		whGrfFileName = 'wh_' + files['source'] + '_' + files['file_name'] + '.grf';

  		sfdcSrcBody = 	'<?xml version="1.0" encoding="UTF-8"?><Graph author="aaronmyhre" created="Fri Oct 31 11:04:19 PDT 2014" guiVersion="3.4.4.P" id="1414988851459" licenseType="Commercial" modified="Sun Nov 02 20:29:25 PST 2014" modifiedBy="aaronmyhre" name="asdasd" revision="1.1" showComponentDetails="true">
						<Global>
						<Property fileURL="workspace.prm" id="GraphParameter0"/>
						<Dictionary/>
						</Global>
						<Phase number="0">
						<Node enabled="enabled" guiName="CSV Writer" guiX="645" guiY="78" id="CSV_WRITER" type="DATA_WRITER"/>
						<Node enabled="enabled" guiName="DBExecute" guiX="63" guiY="296" id="DBEXECUTE" type="DB_EXECUTE"/>
						<Node enabled="enabled" guiName="Reformat" guiX="466" guiY="78" id="REFORMAT" type="REFORMAT"/>
						<Node enabled="enabled" guiName="SF Reader" guiX="54" guiY="78" id="SF_READER" type="SF_READER"/>
						<Node enabled="enabled" guiName="SF Reader (Deleted Records)" guiX="54" guiY="178" id="SF_READER_DELETED_RECORDS" type="SF_DELETED_READER"/>
						<Node enabled="enabled" guiName="SimpleGather" guiX="291" guiY="78" id="SIMPLE_GATHER" type="SIMPLE_GATHER"/>
						<Edge fromNode="REFORMAT:0" guiBendpoints="" guiRouter="Manhattan" id="Edge1" inPort="Port 0 (in)" outPort="Port 0 (out)" toNode="CSV_WRITER:0"/>
						<Edge fromNode="SF_READER:0" guiBendpoints="" guiRouter="Manhattan" id="Edge0" inPort="Port 0 (in)" outPort="Port 0 (output)" toNode="SIMPLE_GATHER:0"/>
						<Edge fromNode="SF_READER_DELETED_RECORDS:0" guiBendpoints="" guiRouter="Manhattan" id="Edge3" inPort="Port 1 (in)" outPort="Port 0 (output)" toNode="SIMPLE_GATHER:1"/>
						<Edge fromNode="SIMPLE_GATHER:0" guiBendpoints="" guiRouter="Manhattan" id="Edge2" inPort="Port 0 (in)" outPort="Port 0 (out)" toNode="REFORMAT:0"/>
						</Phase>
						</Graph>
						';
		blankSrcBody = '<?xml version="1.0" encoding="UTF-8"?><Graph author="aaronmyhre" created="Fri Jun 06 12:12:35 PDT 2014" guiVersion="3.4.4.P" id="1402082820853" licenseType="Commercial" modified="Mon Nov 03 10:18:40 PST 2014" modifiedBy="aaronmyhre" name="test" revision="1.1" showComponentDetails="true">
						<Global>
						<Property fileURL="workspace.prm" id="GraphParameter0"/>
						<Dictionary/>
						</Global>
						<Phase number="0">
						<Node enabled="enabled" guiName="DBExecute" guiX="28" guiY="47" id="DBEXECUTE" type="DB_EXECUTE"/>
						</Phase>
						</Graph>';

  		case files['type']
 			when 'cdc'
 				case files['source'] 
 					when 'SFDC'
 					# source to src scfc version
 					out_file = File.new(srcGrfFilePath + srcGrfFileName, 'w');
					out_file.puts(sfdcSrcBody);
					out_file.close;
 					else
 					# source to src other version
 					out_file = File.new(srcGrfFilePath + srcGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
 					end
 					#source to temp
 					out_file = File.new(tempGrfFilePath + tempGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
 					#temp to stg
 					out_file = File.new(stgGrfFilePath + stgGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
 					#stg to wh
 					out_file = File.new(whGrfFilePath + whGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
 			when 'incremental'
 				case files['source'] 
 					when 'SFDC'
 					# source to src scfc version
 					out_file = File.new(srcGrfFilePath + srcGrfFileName, 'w');
					out_file.puts(sfdcSrcBody);
					out_file.close;
 					else
 					# source to src other version
 					out_file = File.new(srcGrfFilePath + srcGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
 					end
 					#source to stg
 					out_file = File.new(stgGrfFilePath + stgGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
 					#ssource to hw
 					out_file = File.new(whGrfFilePath + whGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
 			when 'full'
 				case files['source'] 
 					when 'SFDC'		
 					# source to src
 					out_file = File.new(srcGrfFilePath + srcGrfFileName, 'w');
					out_file.puts(sfdcSrcBody);
					out_file.close;
 					else
 					# source to src scfc version
 					out_file = File.new(srcGrfFilePath + srcGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
 					end
 					#src to wh 
 					out_file = File.new(whGrfFilePath + whGrfFileName, 'w');
					out_file.puts(blankSrcBody);
					out_file.close;
		end

	end 

 
 else
 	puts "wtf are you doing? Lets be serious please.";
 end


