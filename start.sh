source env.sh && nohup node gw.js > nohup.out 2>&1 &
echo $! > app.pid && tail -f nohup.out
