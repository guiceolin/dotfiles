which -s git
if [[ $? != 0 ]] ; then
  echo -n '> To install k plugin, you need git.'
  echo -n '> Skipping k plugin install.'
else
  git clone https://github.com/supercrabtree/k.git
fi
