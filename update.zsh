#!/bin/zsh
export STORY="$HOME/story/"

git clone -q https://github.com/OST-Gh/story.git $STORY/clone

rm -rf $STORY/mods/*
mv -f $STORY/clone/mods $STORY

update_scripts() {
  if [[ ! $1 ]]; then; return; fi
  if [ "$(cat $STORY/clone/$1.zsh)" != "$(cat $STORY/$1.zsh)"  ]; then
    mv -f $STORY/clone/$1.zsh $STORY
  fi
}

update_scripts update
update_scripts build

rm -rf clone
