which -s git
if [[ $? != 0 ]] ; then
  echo -n '> To install z plugin, you need git.'
  echo -n "> Skipping Z plugin install."
else
  git clone git@github.com:rupa/z.git
fi
