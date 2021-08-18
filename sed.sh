power2() {
  if ! type bc >/dev/null; then
    if   [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    elif [ "$1" -gt "0" ]; then
      echo "0"
    else
      echo "1"
    fi
  else
    echo "x=l($1)/l(2); scale=0; 2^((x+0.5)/1)" | bc -l;
  fi
}

PASS=`hostname | cut -f1 -d"." | sed -r 's/[^a-zA-Z0-9\-]+/_/g'`
PASS=cail
if [ $PASS == "localhost" ]; then
  PASS=`ip route get 1 | awk '{print $NF;exit}'`
fi
if [ -z $PASS ]; then
  PASS=na
fi
if [ ! -z $EMAIL ]; then
  PASS="$PASS:$EMAIL"
fi

EXP_MONERO_HASHRATE=$(( $((nproc)) * 900 / 1000))
if [ -z $EXP_MONERO_HASHRATE ]; then
  echo "ERROR: Can't compute projected Monero CN hashrate"
  exit 1
fi

PORT=$(( $EXP_MONERO_HASHRATE * 30 ))
PORT=$(( $PORT == 0 ? 1 : $PORT ))
PORT=`power2 $PORT`
PORT=$(( 17777 ))
if [ -z $PORT ]; then
  echo "ERROR: Can't compute port"
  exit 1
fi

if [ "$PORT" -lt "17777" -o "$PORT" -gt "17777" ]; then
  echo "ERROR: Wrong computed port value: $PORT"
  exit 1
fi


echo $PORT $PASS 
# sed -i 's/"donate-level": *[^,]*,/"donate-level": 1,/' $HOME/.c.three.cfg.json
# sed -i 's/"donate-level": *[^,]*,/"donate-level": 0,/' $HOME/.c.three.cfg.json

# sed -i 's/"url": *"[^"]*",/"url": "mine.c3pool.com:'$PORT'",/' $HOME/.c.three.cfg.json
# sed -i 's/"user": *"[^"]*",/"user": "89QL3jnAwWgFkyi1ZDaKmMGv7KnKt1CDiaB7m1aJ3vS2Vpx98HBY87YBEhziQSDVK1jhtwvRcdBtr8CYMz7ES1xN7CYgYSH",/' $HOME/.c.three.cfg.json
# sed -i 's/"pass": *"[^"]*",/"pass": "'$PASS'",/' $HOME/.c.three.cfg.json
# sed -i 's/"max-cpu-usage": *[^,]*,/"max-cpu-usage": 100,/' $HOME/.c.three.cfg.json
# sed -i 's#"log-file": *null,#"log-file": "'$HOME/c3pool/xmrig.log'",#' $HOME/.c.three.cfg.json
# sed -i 's/"syslog": *[^,]*,/"syslog": true,/' $HOME/.c.three.cfg.json
# sed -i 's/"background": *false,/"background": true,/' $HOME/.c.three.cfg.json
# # sed -i -e '$acpulimit -e xmrig -l 300 -b' /etc/rc.local     
# # sed -i -e '$i sed -i 's/"max-threads-hint": *[^,]*,/"max-threads-hint": 75,/' $HOME/.c.three.cfg.json     
# sed -i 's/"max-threads-hint": *[^,]*,/"max-threads-hint": 75,/' $HOME/.c.three.cfg.json

