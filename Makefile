# Please don't use this makefile unless rake isn't an option for you.
# It won't necessarily get all the support that the Rakefile does.

all: warning config

warning:
	@printf "\nNOTE: Please use Rakefile if possible: Makefile might not track newest features.\n\n" > /dev/stderr

# Add more files as needed, eg work_hosts and personal_hosts
# Make sure that files are listed in the order you wish for them to be concatenated.
# And don't forget to change the other duplicate copies elsewhere...

config: src/warning src/head src/hosts src/tail
	@echo "Building ssh config" >> /dev/stderr
	cat src/warning src/head src/hosts src/tail > config

clean:
	rm -f config
