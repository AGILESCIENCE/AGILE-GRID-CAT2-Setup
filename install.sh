#AGILE, CFITSIO and ROOTSYS env variabile needed 

echo "install BUILD Science Tools"
cd AGILE-GRID-ScienceTools-Setup
#./downloadScienceTools.sh
#./downloadIRF.sh
#./installScienceTools.sh
#./installIRF.sh 
cd ..

echo "install DeepVar in $DEEPVAR - manual setup needed"
test -d $DEEPVAR || mkdir -p $DEEPVAR
cp -rf DeepVar $DEEPVAR

echo "install AGILE-GRID-scripts-cat2"
cd AGILE-GRID-scripts-cat2
./install.sh
cd ..

echo "intall WilksScripts in $AGILE/scripts"
test -d $AGILE/scripts || mkdir -p $AGILE/scripts
cd WilksScripts
cp -rf WilksStd $AGILE/scripts
cp -rf WilksGen $AGILE/scripts
