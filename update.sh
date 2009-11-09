#!/bin/sh
clear
echo "Updating sctutorium via SVN (Juan) ..."
cd ~/dev/__svn/sctutorium
svn up

echo "\n\nUpdating scprivatepool via Git (GitHub) ..."
cd ~/dev/__git/scprivatepool
git pull

echo "\n\nUpdating CNToolsSC3 via Git (GitHub)..."
cd ~/dev/__git/CNToolsSC3
git pull

echo "\n\nUpdating SuperCollider SOURCE via SVN (Sourceforge) ..."
cd ~/dev/__svn/SuperCollider_trunk
svn up

echo "\n\nUpdating SuperCollider PLUGINS via SVN (Sourceforge) ..."
cd ~/dev/__svn/SuperCollider_plugins
svn up

echo "\n\nUpdating SuperCollider QUARKS via SVN (Sourceforge) ..."
cd ~/Library/Application\ Support/SuperCollider/quarks
svn up