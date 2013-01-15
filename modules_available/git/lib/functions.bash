#Git status on PS1
function __repo_branch ()
{
    __git_ps1
}
function __repo_dirty ()
{

  # Search for .git-prompt-disable file in parent directories
  dir=`pwd`
  while [ `dirname "$dir"` != "$dir" ] ; do
    if [ -f "$dir/.git-prompt-disable" ] ; then perl -e 'print "? "' ; return ; fi
    dir=`dirname "$dir"`
  done

  git status 2>&1 | grep "Not a git repository" > /dev/null && return
  git status 2>/dev/null | grep "working directory clean" >/dev/null || perl -e 'print "* "'
}
