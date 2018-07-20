which -s git
if [[ $? != 0 ]] ; then
  echo -n '> To install k plugin, you need git.'
  echo -n '> Skipping k plugin install.'
else
  git clone git@github.com:supercrabtree/k.git
fi
