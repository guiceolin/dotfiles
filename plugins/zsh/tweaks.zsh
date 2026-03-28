setopt no_beep              # don't beep on error
setopt interactive_comments # allow comments in interactive shells
setopt long_list_jobs       # list jobs in the long format by default

# ===== Changing Directories
setopt auto_cd           # type a directory name to cd into it
setopt cdablevarS        # cd into a variable whose value is a valid directory
setopt auto_pushd        # make cd push the old directory onto the directory stack
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the stack
setopt pushdminus        # invert the meaning of cd +1 and cd -1

# ===== Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted
