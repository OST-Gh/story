#!/bin/zsh
export MOD="$HOME/mod/packs/garlic/mods"
export STORY="$HOME/story/"

private origin=$PWD
cd $STORY
if [ ! -d mods ]; then
  mkdir mods
else
  rm -rf mods/*
fi

for file in $MOD/*; do
  ln -f $file $STORY/mods/
done

# private origin=$PWD
# cd $STORY
# tar --compress -cf mods.tar.gz mods
# cd $origin

git add -A
git commit -qm "build update."
git push -q
cd $origin
