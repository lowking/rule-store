for pid in `cat app.pid`
do
        kill -9 $pid
done
