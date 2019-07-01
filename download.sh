#!/usr/bin/env bash
#First parameter: git username
#Second parameter: -t -> do not use tags

trap exit ERR

if [ "$2" != "-t" ] ; then
	echo "USE TAGS"
	TAG_SCITOOLS=BUILD25aa
	TAG_DEEPVAR=BUILD4
	TAG_SCRCAT2=v1.0.3
	TAG_WILKS=v1.0.2
fi

echo "--------------"
git clone https://github.com/AGILESCIENCE/AGILE-GRID-ScienceTools-Setup.git
cd AGILE-GRID-ScienceTools-Setup
if [ "$2" != "-t" ]; then
        git checkout $TAG_SCITOOLS
else
        echo "Use master version"
fi
./downloadScienceTools.sh
./downloadIRF.sh
cd ..

echo "--------------"
git clone git@github.com:ASTRO-EDU/DeepVar.git 
cd DeepVar
if [ "$2" != "-t" ]; then
        git checkout $TAG_DEEPVAR
else
        echo "Use master version"
fi
./download_modules.sh
cd ..


echo "--------------"
git clone git@github.com:ASTRO-EDU/AGILE-GRID-scripts-cat2.git 
cd AGILE-GRID-scripts-cat2
if [ "$2" != "-t" ]; then
	git checkout $TAG_SCRCAT2
else
	echo "Use master version"
fi
cd ..

git clone git@github.com:ASTRO-EDU/WilksScripts.git
cd WilksScripts
if [ "$2" != "-t" ]; then
        git checkout $TAG_WILKS
else
        echo "Use master version"
fi
cd ..

