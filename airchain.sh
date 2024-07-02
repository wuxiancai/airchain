sudo tee spam.sh > /dev/null << EOF
#!/bin/bash

while true; do
  $HOME/wasm-station/build/wasmstationd tx bank send node ${addr} 1stake --from node --chain-id station-1 --keyring-backend test -y 
  sleep 6  # Add a sleep to avoid overwhelming the system or network
done
EOF

#后台运行刷tx脚本
nohub bash spam.sh &

}



function evmos_log(){
    journalctl -u evmosd -f
}

function stationd_log(){
    journalctl -u stationd -f
}
function private_key(){
    #evmos私钥#
    cd $HOME/data/airchains/evm-station/ &&  /bin/bash ./scripts/local-keys.sh
    #airchain助记词#
    cat $HOME/.tracks/junction-accounts/keys/wallet.wallet.json

}
function restart(){
sudo systemctl restart evmosd
sudo systemctl restart tracksd
}

function delete_node(){
sudo rm -rf data
                                             300,1         85%
