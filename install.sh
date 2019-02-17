#AGILE, CFITSIO and ROOTSYS env variabile needed 

if [ -z "$AGILE" ] || [ -z $(env | grep "AGILE=") ] ; then
    echo "AGILE environment variable not set. Abort."
    exit
fi
if [ -z "$AGILEPIPE" ] || [ -z $(env | grep "AGILEPIPE=") ] ; then
    export AGILEPIPE=$AGILE/AGILEPIPE
    echo "AGILEPIPE environment variable not set. Use $AGILEPIPE"
fi
if [ -z "$DEEPVAR" ] || [ -z $(env | grep "DEEPVAR=") ] ; then
    echo "DEEPVAR environment variable not set. Abort."
    exit
fi
if [ -z "$CFITSIO" ] || [ -z $(env | grep "CFITSIO=") ] ; then
    echo "CFITSIO environment variable not set. Abort."
    exit
fi
if [ -z "$ROOTSYS" ] || [ -z $(env | grep "ROOTSYS=") ] ; then
    echo "ROOTSYS environment variable not set. Abort."
    exit
fi



echo "install BUILD Science Tools"
cd AGILE-GRID-ScienceTools-Setup
./installScienceTools.sh
./installIRF.sh 
cd ..

CURDIR = $PWD

echo "install DeepVar in $DEEPVAR - manual setup needed"
cp -rf DeepVar $DEEPVAR
cd $DEEPVAR
./install.sh
cd $CURDIR

echo "install AGILE-GRID-scripts-cat2"
cd AGILE-GRID-scripts-cat2
./install.sh
cd ..

echo "intall WilksScripts in $AGILE/scripts"
test -d $AGILE/scripts || mkdir -p $AGILE/scripts
cd WilksScripts
cp -rf WilksStd $AGILE/scripts
cp -rf WilksGen $AGILE/scripts
