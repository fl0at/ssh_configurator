task :default => "config"

# Add more files as needed, eg work_hosts and personal_hosts
# Make sure that files are listed in the order you wish for them to be concatenated.
src_files = FileList.new %w{ src/warning src/head src/hosts src/tail }

file "config" => src_files do |f|
	STDERR.puts "Building ssh config"
	sh "cat #{f.prerequisites.join(' ')} > #{f.name}"
end
