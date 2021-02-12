#!/bin/bash

currentDIR=`pwd`
   codeDIR=${currentDIR}/code
 outputDIR=${currentDIR//github/gittmp}/output

# parentDIR=`dirname ${currentDIR}`
#   dataDIR=${parentDIR}/000-data

if [ ! -d ${outputDIR} ]; then
	mkdir -p ${outputDIR}
fi

cp -r ${codeDIR} ${outputDIR}
cp    $0         ${outputDIR}/code

##################################################
myRscript=${codeDIR}/main.R
stdoutFile=${outputDIR}/stdout.R.`basename ${myRscript} .R`
stderrFile=${outputDIR}/stderr.R.`basename ${myRscript} .R`
R --no-save --args ${codeDIR} ${outputDIR} < ${myRscript} > ${stdoutFile} 2> ${stderrFile}

### ~~~~~ ###
myPyScript=${codeDIR}/main.py
stdoutFile=${outputDIR}/stdout.py.`basename ${myPyScript} .py`
stderrFile=${outputDIR}/stderr.py.`basename ${myPyScript} .py`
python ${myPyScript} ${codeDIR} ${outputDIR} > ${stdoutFile} 2> ${stderrFile}

##################################################
exit
