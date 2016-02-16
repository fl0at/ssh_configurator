task :default => "config"

file "config" => [
	'src/warning',
	'src/head',
	'src/hosts', # add more files as needed, eg work_hosts and personal_hosts
	'src/tail'
	] do |f|
	STDERR.puts "Building ssh config"
	sh "cat #{f.prerequisites.join(' ')} > #{f.name}"
end
