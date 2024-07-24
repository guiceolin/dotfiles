setopt no_beep              # don't beep on error
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)

# ===== Changing Directories
setopt auto_cd           # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt cdablevarS        # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack
setopt auto_pushd        # make cd push the old directory onto the directory stack
setopt pushdminus        # swapped the meaning of cd +1 and cd -1; we want them to mean the opposite of what they mean im csh

# ===== Expansion and Globbing
setopt extendedglob # treat #, ~, and ^ as part of patterns for filename generation

# ===== Correction
# setopt correct # spelling correction for commands
# setopt correct_all # spelling correction for arguments

# ===== Prompt
setopt prompt_subst      # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt # only show the rprompt on the current prompt
unsetopt auto_name_dirs  # do not set auto_name_dirs because it messes up prompts

# ===== Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted
