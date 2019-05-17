#!/bin/bash

################################################################################
#                                                                              #
#  Usage: After GBase Server installed, run this script by user <gbasedbt>.    #
#  Script: GBaseInit.sh                                                        #
#  OS: Linux                                                                   #
#  Version: 1.03                                                               #
#  Last Edited Date: 20170428                                                  #
#  Mail: AntYisOn@hotmail.com                                                  #
#                                                                              #
################################################################################

### User check

if [ $LOGNAME != "gbasedbt" ]
then
    echo "Error: Please run this script by user <gbasedbt> !!!"
    exit
fi

### Write permission check

if [ ! -w ./ ]
then
    echo "Error: Ensure user <gbasedbt> has write permission of current path !!!"
    exit
fi

### Initializing Program

clear
echo -e "\nInitializing Program...\c"
unset LANG
LOGFILE=./InitGBaseDB_`date +%Y%m%d%H%M`.log
/bin/date > $LOGFILE 2>&1

### Memory times

TOTMEM=`cat /proc/meminfo|grep MemTotal |awk '{print $2}'`
if [ ! $TOTMEM ]
then
    TOTMEM=1048576
fi
ntimes=`expr $TOTMEM / 950000`
if [ $ntimes -lt 1 ]
then
    ntimes=1
fi

### Execute or Not

INIT=0
echo "OK"
sleep 1

################################################################################

while [ $INIT -lt 1 ]
do
clear
echo "Main while start!!!" >> $LOGFILE 2>&1 

echo -e "ENTER THE INSTANCE INFORMATION or PRESS <ENTER> TO ACCEPT THE DEFAULT.\n"

### INSTANCE NAME(GBASEDBTSERVER)
read -p "ENTER GBASE INSTANCE NAME (GBASEDBTSERVER) [Default:gbaseserver]: " GBASESERVER
if [ ! $GBASESERVER ]
then
    GBASESERVER=gbaseserver
fi
export GBASEDBTSERVER=$GBASESERVER
echo "export GBASEDBTSERVER=$GBASESERVER" > $HOME/profile.$GBASESERVER

### GBASEDBTDIR
cat /GBASEDBTTMP/.infxdirs > ./.gbasedir.tmp 2>>$LOGFILE
DIRS=`cat ./.gbasedir.tmp|wc -l`
if [ $DIRS -eq 0 ]
then
    echo -e "\nSEARCHING FOR GBASE INSTALL FOLDER, PLEASE WAIT FOR SECONDS..."
    find / -type f -name oninit 2>/dev/null|sed "s#/bin/oninit##g" > ./.gbasedir.tmp
    DIRS=`cat ./.gbasedir.tmp|wc -l`
    if [ $DIRS -eq 0 ]
    then 
        echo "WARNING : Not found any GBase Server Installed !!!"
        DEF_GBASEDIR="/home/gbase"
    else
        echo -e "GBASE INSTALL FOLDER LIST:"
        cat ./.gbasedir.tmp|awk '$0=" "NR") "$0'
        DIRLIST=(`cat ./.gbasedir.tmp`)
        DEF_GBASEDIR=${DIRLIST[0]}
    fi
else
    echo -e "\nGBASE INSTALL FOLDER LIST:"
    cat ./.gbasedir.tmp|awk '$0=" "NR") "$0'
    DIRLIST=(`cat ./.gbasedir.tmp`)
    DEF_GBASEDIR=${DIRLIST[0]}
fi

IFXDIRCHOOSE=0
while [ $IFXDIRCHOOSE -eq 0 ]
do
    read -p "CHOOSE GBASE INSTALL FOLDER(GBASEDBTDIR) [Default:$DEF_GBASEDIR]: " GBASEDIR
    if [ ! $GBASEDIR ]
    then
        GBASEDIR=$DEF_GBASEDIR
    else if [ `echo $GBASEDIR|wc -c` -lt 3 ]
    then
        GBASEDIR=${DIRLIST[$(($GBASEDIR-1))]}
      fi
    fi
    
    ls -l $GBASEDIR/bin/oninit >> $LOGFILE 2>&1
    if [ $? != 0 ]
    then
        echo "WARNING: GBASE INSTALL FOLDER < $GBASEDIR > ERROR!"
    else
        IFXDIRCHOOSE=1
    fi
done
rm -f ./.gbasedir.tmp >> $LOGFILE 2>&1

### Service IP & Port

IPCHOOSE=0
echo -e "\nCHOOSE SERVICE IP ADDRESS FROM THE LIST:"
/sbin/ifconfig -a|grep "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" |awk '{print $1" "$2}'|grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"|awk '$0=" "NR") "$0'
IPLIST=(`/sbin/ifconfig -a|grep "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" |awk '{print $1" "$2}'|grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"`)

while [ $IPCHOOSE -eq 0 ]
do
    read -p "ENTER THE NUMBER FOR YOUR CHOICE [Default:${IPLIST[0]}]: " IPADDRESS
    if [ ! $IPADDRESS ]
    then
        IPADDRESS=${IPLIST[0]}
        if [ ! $IPADDRESS ]
        then
           IPADDRESS=$HOSTNAME
        fi
    else if [ `echo $IPADDRESS|wc -c` -lt 3 ]
    then
        IPADDRESS=${IPLIST[$(($IPADDRESS-1))]} 
      fi
    fi
  
    ping -c 1 $IPADDRESS >> /dev/null 2>&1
    if [ $? != 0 ]
    then
        echo "IP ADDRESS <$IPADDRESS> NOT AVAILABLE!!!"
    else
        IPCHOOSE=1
    fi
done

echo -e ""
read -p "SPECIFY THE PORT NUMBER FOR GBASE [Default:9088]: " GBASE_PORT
if [ ! $GBASE_PORT ]
then
    GBASE_PORT=9088
else if [ $GBASE_PORT -gt 65535 ]
then
    echo -e "WARNING : PORT <$GBASE_PORT> IS INVALID!!! USE DEFAULT"
    GBASE_PORT=9088
  fi
fi

PORTING=`/bin/netstat -an 2>>$LOGFILE|grep tcp|grep ":$GBASE_PORT "|wc -l`
if [ $PORTING -gt 0 ]
then
    echo -e "WARNING : PORT <$GBASE_PORT> IS BEING USED !!! \c"
    GBASE_PORT=9088 
    for p in {1..999}
    do
      PORTING=`/bin/netstat -an 2>>$LOGFILE|grep tcp|grep ":$GBASE_PORT "|wc -l`
      if [  $PORTING -eq 0  ]
      then
          echo -e "USE PORT $GBASE_PORT"
          break
      fi
      GBASE_PORT=$(($GBASE_PORT+$p))
    done
fi

### Set Environment Variables

export GBASEDBTDIR=$GBASEDIR
export GBASEDBTSQLHOSTS=$GBASEDBTDIR/etc/sqlhosts.$GBASESERVER
export ONCONFIG=onconfig.$GBASEDBTSERVER
export PATH=$GBASEDBTDIR/bin:$PATH

### Add Environment Variables to Profile.

echo "export GBASEDBTDIR=$GBASEDIR" >> $HOME/profile.$GBASESERVER
echo "export GBASEDBTSQLHOSTS=$GBASEDBTDIR/etc/sqlhosts.$GBASESERVER" >> $HOME/profile.$GBASESERVER
echo "export ONCONFIG=onconfig.$GBASEDBTSERVER" >> $HOME/profile.$GBASESERVER
echo "export PATH=$GBASEDBTDIR/bin:\$PATH" >> $HOME/profile.$GBASESERVER

echo "source $HOME/profile.$GBASESERVER" >> $HOME/.bash_profile

### Init Type

echo -e "\nINITIALIZE TYPE:"
echo -e " 1) TYPICAL -- Initialize the instance with all features configured with default values."
echo -e " 2) CUSTOM  -- Initialize the instance with specific features that you need."

INITTYPE=0
while [ $INITTYPE != 1 -a $INITTYPE != 2 ]
do 
  read -p "ENTER THE NUMBER FOR YOUR CHOICE [Default:1]: " INITTYPE
  if [ ! $INITTYPE ]
  then
      INITTYPE=1
  fi
done

case $INITTYPE in
'1')
    ### DB_LOCALE
    
    GBASE_LOCALE=en_US.819
    unset DB_LOCALE CLIENT_LOCALE
    echo "unset DB_LOCALE CLIENT_LOCALE" >> $HOME/profile.$GBASESERVER
    DBLOCALE_CHOOSE=1

    ### Chunk/Dbspace Path
    DATADIR=${GBASEDBTDIR}/${GBASESERVER}_dbs
    mkdir -p $DATADIR  >> $LOGFILE 2>&1
    if [ $? != 0 ]
    then
        echo "< $DATADIR > Create directory failed !!!"
        read -p "Press <ENTER> to continue" TEMP_V
        continue
    fi
    chmod 755 $DATADIR >> $LOGFILE 2>&1
    if [ ! -w $DATADIR ]
    then
        echo " $DATADIR Write permission check failed !!!"
        read -p "Press <ENTER> to continue" TEMP_V
        continue
    fi

    DIRFREE=`df -m $DATADIR|grep -v Filesystem|awk 'NF>1{print $((NF-2))}'`

    DBSMAX=`expr $DIRFREE / 3`
    echo DBSMAX=$DBSMAX >> $LOGFILE 2>&1
    
    dirtimes=`expr $DIRFREE / 99`
    echo dirtimes1=$dirtimes >> $LOGFILE 2>&1

    if [ ! $dirtimes ]
    then
        dirtimes=10
    else if [ $dirtimes -lt 5 ]
    then
        echo "Directory free size < 500MB, please choose a bigger one."
    else if [ $dirtimes -gt 1000 ]
    then
        dirtimes=1000
        fi
      fi
    fi

    ### Dbspace Size

    LLOGDBS_SIZE=$(($dirtimes*10))
    if [ $LLOGDBS_SIZE -gt 51200 ]
    then
        LLOGDBS_SIZE=51200
    else if [ $LLOGDBS_SIZE -lt 100 ]
    then
        LLOGDBS_SIZE=100
      fi
    fi

    PLOGDBS_SIZE=$(($dirtimes*10))
    if [ $PLOGDBS_SIZE -gt 51200 ]
    then
        PLOGDBS_SIZE=51200
    else if [ $PLOGDBS_SIZE -lt 100 ]
    then
        PLOGDBS_SIZE=100
      fi
    fi

    SBDBS_SIZE=$(($dirtimes*2+30))
    if [ $SBDBS_SIZE -gt 51200 ]
    then
        SBDBS_SIZE=51200
    else if [ $SBDBS_SIZE -lt 50 ]
    then
        SBDBS_SIZE=50
      fi
    fi
    
    TMPDBS_SIZE=$(($dirtimes*2+30))
    if [ $TMPDBS_SIZE -gt 5120 ]
    then
        TMPDBS_SIZE=5120
    else if [ $TMPDBS_SIZE -lt 50 ]
    then
        TMPDBS_SIZE=50
      fi
    fi
    
    NUM_TEMP_DBS=1
    NUM_DATA_DBS=1

    ### Llog & Plog Size
    LOG_SIZE=$(($LLOGDBS_SIZE/40))
    if [ $LOG_SIZE -lt 10 ]
    then
        LOG_SIZE=10
    else if [ $LOG_SIZE -gt 500 ]
    then
        LOG_SIZE=500
      fi
    fi

    LOG_NUM=$(($LLOGDBS_SIZE/$LOG_SIZE))
    LOG_NUM=${LOG_NUM%.*}
    
    ### GL_USEGLU
    unset GL_USEGLU
    ENV_GL_USEGLU=0
    echo "unset GL_USEGLU" >> $HOME/profile.$GBASESERVER
   
    ;;
'2')

    ### DBLOCALE
    
    DBLOCALE_CHOOSE=0
    echo -e "\nGBASE CHARACTER SET LIST:"
    echo " 1) en_US.8859-1"
    echo " 2) zh_CN.GB18030-2000"
    echo " 3) zh_CN.utf8"
    
    while [ $DBLOCALE_CHOOSE -eq 0 ]
    do
    read -p "ENTER THE NUMBER FOR YOUR CHOICE [Default:1]: " GBASE_LOCALE
    if [ ! $GBASE_LOCALE ]
    then
        GBASE_LOCALE=en_US.819
        unset DB_LOCALE CLIENT_LOCALE
        echo "unset DB_LOCALE CLIENT_LOCALE" >> $HOME/profile.$GBASESERVER
        DBLOCALE_CHOOSE=1
    else if [ `echo $GBASE_LOCALE|wc -c` -lt 3 ]
    then 
        if [ $GBASE_LOCALE -eq 1 ]
        then
        GBASE_LOCALE=en_US.819
            unset DB_LOCALE CLIENT_LOCALE
            echo "unset DB_LOCALE CLIENT_LOCALE" >> $HOME/profile.$GBASESERVER
            DBLOCALE_CHOOSE=1
        else if [ $GBASE_LOCALE -eq 2 ]
        then
            GBASE_LOCALE=zh_CN.GB18030-2000
            echo "export DB_LOCALE=$GBASE_LOCALE" >> $HOME/profile.$GBASESERVER
            echo "export CLIENT_LOCALE=$GBASE_LOCALE" >> $HOME/profile.$GBASESERVER
            DBLOCALE_CHOOSE=2
        else if [ $GBASE_LOCALE -eq 3 ]
        then
            GBASE_LOCALE=zh_CN.utf8
            echo "export DB_LOCALE=$GBASE_LOCALE" >> $HOME/profile.$GBASESERVER
            echo "export CLIENT_LOCALE=$GBASE_LOCALE" >> $HOME/profile.$GBASESERVER
            DBLOCALE_CHOOSE=3
            fi
          fi
        fi
      fi
    fi
    done

    ### Chunk/Dbspace Path
    
    echo -e ""
    DIRCHOOSE=0
    while [ $DIRCHOOSE -eq 0 ]
    do
    read -p "ENTER THE DATA SPACE PATH [Default:${GBASEDBTDIR}/${GBASESERVER}_dbs]: " DATADIR
    if [ ! $DATADIR ]
    then
        DATADIR=${GBASEDBTDIR}/${GBASESERVER}_dbs
    fi
    
    if [ ! -d $DATADIR ]
    then    
        mkdir -p $DATADIR  >> $LOGFILE 2>&1
        if [ $? != 0 ]
        then
            echo "< $DATADIR > Create directory failed !!!"
            continue
        fi
    fi
    chmod 755 $DATADIR >> $LOGFILE 2>&1
    if [ ! -w $DATADIR ]
    then
        echo " $DATADIR Write permission check failed !!!"
        continue
    fi
    
    DIRFREE=`df -m $DATADIR|grep -v Filesystem|awk 'NF>1{print $((NF-2))}'`
    
    DBSMAX=`expr $DIRFREE / 3`
    echo DBSMAX=$DBSMAX >> $LOGFILE 2>&1
    
    dirtimes=`expr $DIRFREE / 99`
    echo dirtimes1=$dirtimes >> $LOGFILE 2>&1
    
    if [ ! $dirtimes ]
    then
        dirtimes=10
        DIRCHOOSE=1
    else if [ $dirtimes -lt 5 ]
    then
        echo "Directory free size < 500MB, please choose a bigger one."
    else if [ $dirtimes -gt 1000 ]
    then
        dirtimes=1000
        DIRCHOOSE=1
    else
        DIRCHOOSE=1
        fi
      fi
    fi
    done
    echo dirtimes2=$dirtimes >> $LOGFILE 2>&1
    
    ### Dbspace Size
    echo -e ""
    read -p "ENTER THE LOGICAL LOG DBSPACE SIZE(MB) [Default:$(($dirtimes*10))]: " LLOGDBS_SIZE
    LLOGDBS_SIZE=`echo $LLOGDBS_SIZE|tr -cd "[0-9]"`
    if [ ! $LLOGDBS_SIZE ]
    then
        LLOGDBS_SIZE=$(($dirtimes*10))
    else
    if [ $LLOGDBS_SIZE -gt 51200 ]
    then              
        LLOGDBS_SIZE=51200
    else if [ $LLOGDBS_SIZE -lt 100 ]
    then
        LLOGDBS_SIZE=100
        fi
      fi
    fi
    if [ $LLOGDBS_SIZE -gt $DBSMAX ]
    then
        LLOGDBS_SIZE=$DBSMAX
    fi
    
    echo -e ""
    read -p "ENTER THE PHYSICAL LOG DBSPACE SIZE(MB) [Default:$(($dirtimes*10))]: " PLOGDBS_SIZE
    PLOGDBS_SIZE=`echo $PLOGDBS_SIZE|tr -cd "[0-9]"`
    if [ ! $PLOGDBS_SIZE ]
    then
        PLOGDBS_SIZE=$(($dirtimes*10))
    else if [ $PLOGDBS_SIZE -gt 51200 ]
    then              
        PLOGDBS_SIZE=51200
    else if [ $PLOGDBS_SIZE -lt 100 ]
    then
        PLOGDBS_SIZE=100
        fi
      fi
    fi
    if [ $PLOGDBS_SIZE -gt $DBSMAX ]
    then
        PLOGDBS_SIZE=$DBSMAX
    fi
    
    echo -e ""
    read -p "ENTER THE SMART LOB DBSPACE SIZE(MB) [Default:$(($dirtimes*2+30))]: " SBDBS_SIZE
    SBDBS_SIZE=`echo $SBDBS_SIZE|tr -cd "[0-9]"`
    if [ ! $SBDBS_SIZE ]
    then
        SBDBS_SIZE=$(($dirtimes*2+30))
    else if [ $SBDBS_SIZE -gt 51200 ]
    then
        SBDBS_SIZE=51200
    else if [ $SBDBS_SIZE -lt 50 ]
    then
        SBDBS_SIZE=50
        fi
      fi
    fi
    if [ $SBDBS_SIZE -gt $DBSMAX ]
    then
        SBDBS_SIZE=$DBSMAX
    fi
    
    echo -e ""
    read -p "ENTER THE TEMPORARY DBSPACE SIZE(MB) [Default:$(($dirtimes*2+30))]: " TMPDBS_SIZE
    TMPDBS_SIZE=`echo $TMPDBS_SIZE|tr -cd "[0-9]"`
    if [ ! $TMPDBS_SIZE ]
    then
        TMPDBS_SIZE=$(($dirtimes*2+30))
    else if [ $TMPDBS_SIZE -gt 5120 ]
    then              
        TMPDBS_SIZE=5120
    else if [ $TMPDBS_SIZE -lt 50 ]
    then
        TMPDBS_SIZE=50
        fi
      fi
    fi
    if [ $TMPDBS_SIZE -gt $DBSMAX ]
    then
        TMPDBS_SIZE=$DBSMAX
    fi
    
    ###Llog & Plog Size
    LOG_SIZE=$(($LLOGDBS_SIZE/40))
    if [ $LOG_SIZE -lt 10 ]
    then
        LOG_SIZE=10
    else if [ $LOG_SIZE -gt 500 ]
    then
        LOG_SIZE=500
      fi
    fi
    
    LOG_NUM=$(($LLOGDBS_SIZE/$LOG_SIZE))
    LOG_NUM=${LOG_NUM%.*}

    ### Advanced settings
    echo -e ""
    ADVANCED_SETTING=0
    while [[ $ADVANCED_SETTING != [YyNn] ]]
    do
        read -p "ENTER \"Y\" TO START DATABASE ADVANCED SETTINGS, OR ENTER \"N\" TO ACCEPT DEFAULT VALUES: [Default:N]: " ADVANCED_SETTING
        if [ ! $ADVANCED_SETTING ]
        then
            ADVANCED_SETTING=N
        fi
    done
    
    if [ "$ADVANCED_SETTING" == "Y" -o "$ADVANCED_SETTING" == "y" ]
    then
        ### Number of datadbs
        
        echo -e ""
        read -p "ENTER THE NUMBER OF DATA DBSPACES [Default:1]: " NUM_DATA_DBS
        NUM_DATA_DBS=`echo $NUM_DATA_DBS|tr -cd "[0-9]"`
        if [ ! $NUM_DATA_DBS ]
        then
            NUM_DATA_DBS=1
        else if [ $NUM_DATA_DBS -gt 20 ]
            then
            NUM_DATA_DBS=20
        else if [ $NUM_DATA_DBS -lt 1 ]
        then
            NUM_DATA_DBS=1
            fi
          fi
        fi

        ### Number of tempdbs
        
        echo -e ""
        read -p "ENTER THE NUMBER OF TEMP DBSPACES [Default:1]: " NUM_TEMP_DBS
        NUM_TEMP_DBS=`echo $NUM_TEMP_DBS|tr -cd "[0-9]"`
        if [ ! $NUM_TEMP_DBS ]
        then
            NUM_TEMP_DBS=1
        else if [ $NUM_TEMP_DBS -gt 8 ]
            then
            NUM_TEMP_DBS=8
        else if [ $NUM_TEMP_DBS -lt 1 ]
        then
            NUM_TEMP_DBS=1
            fi
          fi
        fi

        ### Environment GL_USEGLU
        echo ""
        ENV_GL_USEGLU=A
        while [[ $ENV_GL_USEGLU != [YyNn10] ]] 
        do
            read -p "Enter \"Y\" TO ENABLE ENVIRONMENT GL_USEGLU, OR ENTER \"N\" TO DISABLE: [Default:N]: " ENV_GL_USEGLU
            if [ ! $ENV_GL_USEGLU ]
            then
                ENV_GL_USEGLU=0
            fi
        done
        
        if [ "$ENV_GL_USEGLU" == "Y" -o "$ENV_GL_USEGLU" == "y" -o $ENV_GL_USEGLU == 1 ]
        then
            ENV_GL_USEGLU=1
            export GL_USEGLU=$ENV_GL_USEGLU
            echo "export GL_USEGLU=$ENV_GL_USEGLU" >> $HOME/profile.$GBASESERVER
        else
            unset GL_USEGLU
            ENV_GL_USEGLU=0
            echo "unset GL_USEGLU" >> $HOME/profile.$GBASESERVER
        fi
        
        
    else
        NUM_DATA_DBS=1
        NUM_TEMP_DBS=1
        unset GL_USEGLU
        ENV_GL_USEGLU=0
        
    fi

    ;;
esac

echo -e "\nINSTANCE SUMMARY:"
echo -e "  Instance name:              " $GBASEDBTSERVER
echo -e "  GBase install directory:    " $GBASEDBTDIR
echo -e "  IP address & port:          " $IPADDRESS:$GBASE_PORT
echo -e "  Character set:              " $GBASE_LOCALE
echo -e "  Logical log space size:     " $LLOGDBS_SIZE" MB"
echo -e "  Physical log space size:    " $PLOGDBS_SIZE" MB"
echo -e "  Smart LOB space size:       " $SBDBS_SIZE" MB"
echo -e "  Temp DBSpace size:          " $TMPDBS_SIZE" MB"
echo -e "  Data path:                  " $DATADIR
echo -e "  Data path free size:        " $DIRFREE" MB"

if [ $INITTYPE -eq 2 ]
then
if [ "$ADVANCED_SETTING" == "Y" -o "$ADVANCED_SETTING" == "y" ]
then
echo -e "  The number of data DBSpace: " $NUM_DATA_DBS
echo -e "  The number of temp DBSpace: " $NUM_TEMP_DBS
echo -e "  Environment GL_USEGLU:      " $ENV_GL_USEGLU
  fi 
fi

echo ""

YN=0
while [[ $YN != [YyNn] ]]
do
    read -p "Enter \"Y\" to Start database initializing, or Enter \"N\" to Edit Again: " YN
done

if [[ $YN == [Yy] ]]
then
    INIT=1
fi

done

echo -e "  Instance name:              " $GBASEDBTSERVER        >> $LOGFILE 2>&1
echo -e "  GBase install directory:    " $GBASEDBTDIR           >> $LOGFILE 2>&1
echo -e "  IP address & port:          " $IPADDRESS $GBASE_PORT >> $LOGFILE 2>&1
echo -e "  Character set:              " $GBASE_LOCALE          >> $LOGFILE 2>&1
echo -e "  Logical log space size:     " $LLOGDBS_SIZE" MB"     >> $LOGFILE 2>&1
echo -e "  Physical log space size:    " $PLOGDBS_SIZE" MB"     >> $LOGFILE 2>&1
echo -e "  Temp DBSpace size:          " $TMPDBS_SIZE" MB"      >> $LOGFILE 2>&1
echo -e "  Smart LOB space size:       " $SBDBS_SIZE" MB"       >> $LOGFILE 2>&1
echo -e "  Temp DBSpace size:          " $TMPDBS_SIZE" MB"      >> $LOGFILE 2>&1
echo -e "  The number of data DBSpace: " $NUM_DATA_DBS          >> $LOGFILE 2>&1
echo -e "  Data path:                  " $DATADIR               >> $LOGFILE 2>&1
echo -e "  Data path free size:        " $DIRFREE" MB\n"        >> $LOGFILE 2>&1
echo -e "  Environment GL_USEGLU:      " $ENV_GL_USEGLU         >> $LOGFILE 2>&1
echo -e "  The number of temp DBSpace: " $NUM_TEMP_DBS          >> $LOGFILE 2>&1

################################################################################

echo -e "Start time: \c" >> $LOGFILE 2>&1
/bin/date >> $LOGFILE 2>&1

### Making DIR & Touching Chunks 
echo -e "\nTouching Chunks...\c"
#mkdir -p $DATADIR  >> $LOGFILE 2>&1
#chmod 755 $DATADIR >> $LOGFILE 2>&1
touch $DATADIR/rootdbs  >> $LOGFILE 2>&1
touch $DATADIR/llogdbs  >> $LOGFILE 2>&1
touch $DATADIR/plogdbs  >> $LOGFILE 2>&1
touch $DATADIR/sbspace1 >> $LOGFILE 2>&1

touch $DATADIR/tmpdbs1  >> $LOGFILE 2>&1
ntmp=2
while [ $ntmp -le $NUM_TEMP_DBS ]
do
    touch ${DATADIR}/tmpdbs${ntmp}  >> $LOGFILE 2>&1
    ntmp=$(($ntmp+1))
done

for j in `seq $NUM_DATA_DBS`
do
    touch ${DATADIR}/datadbs${j}_1
done

### Change Owner & Permissions 
chown gbasedbt:gbasedbt $DATADIR/*
chmod 0660 $DATADIR/*

echo "OK"

### Delete sysadmin stop file if exists
rm -f $GBASEDBTDIR/etc/sysadmin/stop >> $LOGFILE 2>&1

### Create File: sqlhosts
echo -e "Create sqlhosts File:  $GBASEDBTSQLHOSTS ...\c"
echo "$GBASEDBTSERVER onsoctcp $IPADDRESS $GBASE_PORT" > $GBASEDBTSQLHOSTS
echo "OK"

# Setting Parameters in onconfig

echo -e "Setting Parameters in $GBASEDBTDIR/etc/onconfig."$GBASEDBTSERVER" :"
cp -f $GBASEDBTDIR/etc/onconfig.std $GBASEDBTDIR/etc/$ONCONFIG
if [ $? != 0 ]
then
    echo "Error: Create $GBASEDBTDIR/etc/$ONCONFIG file error !!!"
    exit
fi

sed -i "s#^ROOTPATH.*#ROOTPATH $DATADIR/rootdbs #g" $GBASEDBTDIR/etc/$ONCONFIG
echo -e "ROOTPATH.\c"

sed -i "s#^ROOTSIZE.*#ROOTSIZE 204800 #g" $GBASEDBTDIR/etc/$ONCONFIG
echo -e "ROOTSIZE.\c"

sed -i "s#^DBSERVERNAME.*#DBSERVERNAME $GBASEDBTSERVER #g" $GBASEDBTDIR/etc/$ONCONFIG
echo -e "DBSERVERNAME.\c"

sed -i "s#^FULL_DISK_INIT.*#FULL_DISK_INIT 1 #g" $GBASEDBTDIR/etc/$ONCONFIG
echo -e "FULL_DISK_INIT.\c"

sed -i "s#^SBSPACENAME.*#SBSPACENAME sbspace1 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "SBSPACENAME.\c"

sed -i "s#^SYSSBSPACENAME.*#SYSSBSPACENAME sbspace1 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "SYSSBSPACENAME.\c"

### Tempdbs
ntmp=2
TMP_DBS_CONF=tmpdbs1
while [ $ntmp -le $NUM_TEMP_DBS ]
do
    TMP_DBS_CONF=$TMP_DBS_CONF,tmpdbs$ntmp
    ntmp=$(($ntmp+1))
done
sed -i "s#^DBSPACETEMP.*#DBSPACETEMP $TMP_DBS_CONF #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "DBSPACETEMP.\c"

sed -i "s#LOGFILES.*#LOGFILES 3 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "LOGFILES.\c"

sed -i "s#^MULTIPROCESSOR.*#MULTIPROCESSOR 1 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "MULTIPROCESSOR.\c"

### CPU VP
NUM_CPU=`cat /proc/cpuinfo|grep processor|wc -l` >> $LOGFILE 2>&1
if [ $NUM_CPU -gt 8 ]
then
   NUM_CPU=$(($NUM_CPU-1))
else if [ $NUM_CPU -lt 1 ]
then
   NUM_CPU=1
  fi
fi
sed -i "s#^VPCLASS.*#VPCLASS cpu,num=$NUM_CPU,noage #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "VPCLASS.\c"

if [ $NUM_CPU -gt 20 ]
then
    NUM_NET=10
else if [ $NUM_CPU -lt 5 ]
then
    NUM_NET=1
else
    NUM_NET=$(($NUM_CPU/2))
    NUM_NET=${NUM_NET%.*}
  fi
fi
sed -i "s#^NETTYPE.*#NETTYPE soctcp,$NUM_NET,200,CPU #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "NETTYPE.\c"

sed -i "s#^CLEANERS.*#CLEANERS 32 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "CLEANERS.\c"

sed -i "s#^DEF_TABLE_LOCKMODE.*#DEF_TABLE_LOCKMODE row #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "DEF_TABLE_LOCKMODE.\c"

sed -i "s#^DIRECT_IO.*#DIRECT_IO 1 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "DIRECT_IO.\c"

### LOCKS
LOCKNUM=$(($ntimes*100000+100000))
if [ $LOCKNUM -gt 20000000 ]
then
    LOCKNUM=20000000
fi
sed -i "s#^LOCKS.*#LOCKS $LOCKNUM #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "LOCKS.\c"

sed -i "s#^TAPEDEV.*#TAPEDEV /dev/null #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "TAPEDEV.\c"

sed -i "s#^LTAPEDEV.*#LTAPEDEV /dev/null #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "LTAPEDEV.\c"

sed -i "s#^CKPTINTVL.*#CKPTINTVL 120 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "CKPTINTVL.\c"

sed -i "s#^DS_MAX_QUERIES.*#DS_MAX_QUERIES 4 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "DS_MAX_QUERIES.\c"

sed -i "s#^DS_TOTAL_MEMORY.*#DS_TOTAL_MEMORY 4096000 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "DS_TOTAL_MEMORY.\c"

sed -i "s#^DS_NONPDQ_QUERY_MEM.*#DS_NONPDQ_QUERY_MEM 20480 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "DS_NONPDQ_QUERY_MEM.\c"

sed -i "s#^PHYSBUFF.*#PHYSBUFF 2048 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "PHYSBUFF.\c"

sed -i "s#^LOGBUFF.*#LOGBUFF 1024 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "LOGBUFF.\c"

sed -i "s#^AUTO_TUNE.*#AUTO_TUNE 0 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "AUTO_TUNE.\c"

sed -i "s#^MSGPATH.*#MSGPATH ${GBASEDBTDIR}/etc/online_${GBASEDBTSERVER}.log #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "MSGPATH.\c"

sed -i "s#^SERVERNUM.*#SERVERNUM $(($RANDOM%254)) #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "SERVERNUM.\c"

sed -i "s#^ALLOW_NEWLINE.*#ALLOW_NEWLINE 1 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "ALLOW_NEWLINE.\c"

sed -i "s#^TEMPTAB_NOLOG.*#TEMPTAB_NOLOG 1 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "TEMPTAB_NOLOG.\c"

sed -i "s#^DUMPSHMEM.*#DUMPSHMEM 0 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "DUMPSHMEM.\c"

sed -i "s#^USEOSTIME.*#USEOSTIME 1 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "USEOSTIME.\c"

sed -i "s#^STACKSIZE.*#STACKSIZE 128 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "STACKSIZE.\c"

sed -i "s#^ON_RECVRY_THREADS.*#ON_RECVRY_THREADS 16 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "ON_RECVRY_THREADS.\c"

sed -i "s#^OFF_RECVRY_THREADS.*#OFF_RECVRY_THREADS 96 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "OFF_RECVRY_THREADS.\c"

sed -i "s#^USELASTCOMMITTED.*#USELASTCOMMITTED \"COMMITTED READ\" #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "USELASTCOMMITTED.\c"


### SHMVIRTSIZE
VIRSIZE=$(($ntimes*51200+25600))
if [ $VIRSIZE -gt 4096000 ]
then 
    VIRSIZE=4096000
fi
sed -i "s#^SHMVIRTSIZE.*#SHMVIRTSIZE $VIRSIZE #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "SHMVIRTSIZE.\c"

### SHMADD
ADDSIZE=$(($ntimes*51200+25600))
if [ $ADDSIZE -gt 1024000 ]
then
    ADDSIZE=1024000
fi
sed -i "s#^SHMADD.*#SHMADD $ADDSIZE #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "SHMADD.\c"

sed -i "s#^GBASEDBTCONTIME.*#GBASEDBTCONTIME 12 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "GBASEDBTCONTIME.\c"

### 2K BUFFER POOL
BP2K=$(($ntimes*25000+10000))
if [ $BP2K -gt 1000000 ]
then
    BP2K=1000000
fi
sed -i "s#^BUFFERPOOL size=2.*#BUFFERPOOL size=2k,buffers=$BP2K,lrus=32,lru_min_dirty=50,lru_max_dirty=60 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "BUFFERPOOL2K.\c"

### 16K BUFFER POOL
BUF_16=`grep "^BUFFERPOOL size=16" $GBASEDBTDIR/etc/$ONCONFIG|wc -l`
if [ $BUF_16 -eq 0 ]
then
   echo "BUFFERPOOL size=16" >> $GBASEDBTDIR/etc/$ONCONFIG
fi

BP16K=$(($ntimes*25000))
if [ $BP16K -gt 3000000 ]
then
    BP16K=3000000
fi
sed -i "s#^BUFFERPOOL size=16.*#BUFFERPOOL size=16k,buffers=$BP16K,lrus=64,lru_min_dirty=25,lru_max_dirty=30 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
echo -e "BUFFERPOOL16K...\c"

ATCKPT=`grep "^AUTO_CKPTS " $GBASEDBTDIR/etc/$ONCONFIG|wc -l`
if [ $ATCKPT -eq 0 ]
then
   echo "AUTO_CKPTS 0" >> $GBASEDBTDIR/etc/$ONCONFIG
else
   sed -i "s#^AUTO_CKPTS.*#AUTO_CKPTS 0 #g" $GBASEDBTDIR/etc/$ONCONFIG >> $LOGFILE 2>&1
fi
echo -e "AUTO_CKPTS.\c"

echo "OK"

################################################################################

echo -e "Initializing Root DBSpace & Share Memory...\c"
unset DB_LOCALE CLIENT_LOCALE
oninit -viy >> $LOGFILE 2>&1

### Wait for creating system database

echo -e "OK\nCreating system database.\c"
for w in {1..5}
do
  sleep 3
  echo -e ".\c"
done

SYSADMINSTOP=`ls -l $GBASEDBTDIR/etc/sysadmin/stop 2>>$LOGFILE|wc -l`
if [ $SYSADMINSTOP -eq 0 ]
then
    TOTNDB=3
else
    TOTNDB=2
fi

i=1
while [ $i -lt 25 ]
do
  sleep 2
  echo -e ".\c"
  ndb=`echo "select count(*) dbnum from sysdatabases"|dbaccess sysmaster 2>>$LOGFILE|grep -Ev "^$|dbnum"`
  echo Number of System databases = $ndb >> $LOGFILE 2>&1
  if [ ! $ndb ]
  then
      ndb=0
      sleep 2
  else if [ $ndb -gt $TOTNDB ]
  then 
      i=99
      sleep 2
    fi
  fi
  i=$(($i+1))
done

### Check sysmaster

if [ $i -lt 99 ]
then
    SYSMASTERDB=`timeout 5 echo "select count(*) from sysdatabases where name='sysmaster'"|dbaccess sysmaster 2>/dev/null|grep -Ev "^$|count"`
    if [ $SYSMASTERDB != 1 ]
    then
        echo "MAIN SYSTEM DATABASE sysmaster NOT EXISTS, CHECK ${GBASEDBTDIR}/tmp/online_${GBASEDBTSERVER}.log FOR MORE INFORMATION." 
        echo "MAIN SYSTEM DATABASE sysmaster NOT EXISTS, CHECK ${GBASEDBTDIR}/tmp/online_${GBASEDBTSERVER}.log FOR MORE INFORMATION." >> $LOGFILE 2>&1
        exit
    fi
fi

### Create dbspaceses

echo -e "OK\nCreating logical log Dbspace...\c"
onspaces -c -d llogdbs -p $DATADIR/llogdbs       -o 0 -s $(($LLOGDBS_SIZE*1024)) >> $LOGFILE 2>&1

echo -e "OK\nCreating physical log Dbspace...\c"
onspaces -c -d plogdbs -p $DATADIR/plogdbs       -o 0 -s $(($PLOGDBS_SIZE*1024)) >> $LOGFILE 2>&1

echo -e "OK\nCreating smart LOB Dbspace...\c"
onspaces -c -S sbspace1 -p $DATADIR/sbspace1     -o 0 -s $(($SBDBS_SIZE*1024))   >> $LOGFILE 2>&1

### Temp dbspaces
echo -e "OK\nCreating temp Dbspace.1.\c"
onspaces -c -d tmpdbs1 -k 16 -p $DATADIR/tmpdbs1 -o 0 -s $(($TMPDBS_SIZE*1024)) -t >> $LOGFILE 2>&1

ntmp=2
while [ $ntmp -le $NUM_TEMP_DBS ]
do
    echo -e "$ntmp.\c"
    onspaces -c -d tmpdbs${ntmp} -k 16 -p ${DATADIR}/tmpdbs${ntmp} -o 0 -s $(($TMPDBS_SIZE*1024)) -t >> $LOGFILE 2>&1
    ntmp=$(($ntmp+1))
done

echo -e "..OK\nCreating data Dbspace.\c"
for n in `seq $NUM_DATA_DBS`
do
    echo -e "$n.\c"
    onspaces -c -d datadbs$n -k 16 -p ${DATADIR}/datadbs${n}_1 -o 0 -s 102400  >> $LOGFILE 2>&1
done
echo "..OK"

echo -e "Setting dbscheduler...\c"
echo "execute function task('scheduler stop')"|dbaccess sysadmin >> $LOGFILE 2>&1
touch $GBASEDBTDIR/etc/sysadmin/stop >> $LOGFILE 2>&1
echo "OK"

echo -e "Moving physical log...\c"
onparams -p -d plogdbs -s $(($PLOGDBS_SIZE*994)) -y  >> $LOGFILE 2>&1
echo "OK"

echo -e "Adding $LOG_NUM logical logs: \c"
for i in `seq $LOG_NUM`
do
    echo -e "$i.\c"
    onparams -a -d llogdbs -s $(($LOG_SIZE*1000)) >> $LOGFILE 2>&1
done
echo "..OK"

echo -e "Setting data chunks extendable...\c"
echo "select c.chknum from sysdbspaces d,syschunks c where d.dbsnum=c.dbsnum and d.name like 'datadbs%'"|dbaccess sysmaster 2>>$LOGFILE|grep -Ev "^$|chknum" > ./.datadbs.tmp
for dbsnum in `cat ./.datadbs.tmp`
do
     echo "execute function task('modify chunk extendable', '$dbsnum')"|dbaccess sysadmin >> $LOGFILE 2>&1
done
echo "OK"
rm -f ./.datadbs.tmp >> $LOGFILE 2>&1

echo -e "Cleaning logical logs in rootdbs...\c"
echo "select number from syslogfil where chunk=1" |dbaccess sysmaster 2>/dev/null|grep -Ev "^$|number" > ./.llog_in_rootdbs.tmp
for i in {1..3}
do
    onmode -l 
    echo -e '.\c'
done
onmode -c
for i in `cat ./.llog_in_rootdbs.tmp`
do
    onparams -d -l $i -y >> $LOGFILE 2>&1
    echo -e '.\c'
done
echo "OK"
rm -f ./.llog_in_rootdbs.tmp >> $LOGFILE 2>&1

################################################################################

### Database Restart

echo -e "Database restarting...\c"
onmode -ky >> $LOGFILE 2>&1
echo -e "..\c"
sleep 1
oninit -v >> $LOGFILE 2>&1
echo -e "..\c"
sleep 1

### Status Check

OL=`onstat -|grep "On-Line"|wc -l`
if [ $OL -eq 1 ]
then 
  echo "OK"
else
  echo -e "\nInitalize Failed,See "`onstat -m|grep "Message Log File"` "For Details"
fi

### Create database : gbasedb

if [ $DBLOCALE_CHOOSE -eq 2 ]
then
    export DB_LOCALE=zh_CN.GB18030-2000
    export CLIENT_LOCALE=zh_CN.GB18030-2000    
else if [ $DBLOCALE_CHOOSE -eq 3 ]
then
    export DB_LOCALE=zh_CN.utf8
    export CLIENT_LOCALE=zh_CN.utf8
else 
    unset DB_LOCALE CLIENT_LOCALE 
  fi
fi

echo -e "Creating database: gbasedb...\c"
echo "create database gbasedb in datadbs1 with log;create synonym dual for sysmaster:sysdual;" | dbaccess sysmaster >> $LOGFILE 2>&1
echo "OK"

### JDBC

JDBCFILE="${GBASEDBTDIR}/jdbc/lib/ifxjdbc.jar"
ls -l $JDBCFILE >> $LOGFILE 2>&1
if [ $? -eq 0 ]
then
echo -e "\nGBase JDBC Driver: $JDBCFILE "
fi
echo -e "\nNow you can use this URL to connect to gbasedb:"

if [ $ENV_GL_USEGLU -eq 1 ]
then
    URL_GLU="GL_USEGLU=1"
else
    URL_GLU=""
fi

if [ $DBLOCALE_CHOOSE -eq 1 ]
then 
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;$URL_GLU"
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;$URL_GLU" >> $LOGFILE 2>&1
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;$URL_GLU" >> $GBASEDBTDIR/tmp/URL.txt
else if [ $DBLOCALE_CHOOSE -eq 2 ]
then
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;DB_LOCALE=zh_CN.GB18030-2000;CLIENT_LOCALE=zh_CN.GB18030-2000;NEWCODESET=GB18030,GB18030-2000,5488;$URL_GLU"
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;DB_LOCALE=zh_CN.GB18030-2000;CLIENT_LOCALE=zh_CN.GB18030-2000;NEWCODESET=GB18030,GB18030-2000,5488;$URL_GLU" >> $LOGFILE 2>&1
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;DB_LOCALE=zh_CN.GB18030-2000;CLIENT_LOCALE=zh_CN.GB18030-2000;NEWCODESET=GB18030,GB18030-2000,5488;$URL_GLU" >> $GBASEDBTDIR/tmp/URL.txt
else if [ $DBLOCALE_CHOOSE -eq 3 ]
then
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;DB_LOCALE=zh_CN.utf8;CLIENT_LOCALE=zh_CN.utf8;NEWCODESET=UTF8,utf8,57372;$URL_GLU"
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;DB_LOCALE=zh_CN.utf8;CLIENT_LOCALE=zh_CN.utf8;NEWCODESET=UTF8,utf8,57372;$URL_GLU" >> $LOGFILE 2>&1
    echo "jdbc:gbasedbt-sqli://$IPADDRESS:$GBASE_PORT/gbasedb:GBASEDBTSERVER=$GBASEDBTSERVER;DB_LOCALE=zh_CN.utf8;CLIENT_LOCALE=zh_CN.utf8;NEWCODESET=UTF8,utf8,57372;$URL_GLU" >> $GBASEDBTDIR/tmp/URL.txt
    fi
  fi
fi

### Version & info

echo -e "\nVersion:"
onstat - |grep -v ^$ 
onstat -version |grep "Build Number"
onstat -version >> $LOGFILE 2>&1
onstat -d >> $LOGFILE 2>&1
onstat -g seg >> $LOGFILE 2>&1

### Exit & Logout

echo -e "Finish time: \c" >> $LOGFILE 2>&1
/bin/date >> $LOGFILE 2>&1
echo -e "\nGBase Initializing Finished!\n"
echo -e "Initialize log file : $LOGFILE "
echo -e "\nPress <ENTER> to Exit and Logout..."
read TEMP_V
ps -ef|grep -w $$|sort -nk 2|head -1|awk '{print "kill -9 "$3}'|sh

### End of file