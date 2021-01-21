############ set properties ############
if [ -z "$SLEEPTIME" ]; then
    SLEEPTIME=0
    echo "SLEEPTIME set to $SLEEPTIME seconds"
    export SLEEPTIME
fi

if [ -z "$XMX" ]; then
    XMX="-Xmx2g"
    echo "XMX set to $XMX"
    export XMX
fi

############ run script ############
if [ $SLEEPTIME = 0 ]; then
    java -jar triplifier.jar
else
    while true
    do
        java $XMX -jar -c triplifier.jar
        echo "================================== SLEEP =================================="
        sleep $SLEEPTIME
    done
fi
