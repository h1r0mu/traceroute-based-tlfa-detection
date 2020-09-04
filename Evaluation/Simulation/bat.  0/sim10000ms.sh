#パラメータとかディレクトリとか
dir="1000_10000ms"
dataset="dataset_1000a.txt"
user_dir="/Users/Kei/Desktop/SimulationData"
SIM_TIME=100
loopcount=99
bot_num=2000
interval=10000

SECONDS=0
mkdir ${user_dir}/${dir}
rm -r ${user_dir}/${dir}/attack ${user_dir}/${dir}/threshold ${user_dir}/${dir}/AUC
rm -r ${user_dir}/${dir}/attack2 ${user_dir}/${dir}/threshold2 ${user_dir}/${dir}/AUC2
mkdir ${user_dir}/${dir}/attack ${user_dir}/${dir}/threshold ${user_dir}/${dir}/AUC
mkdir ${user_dir}/${dir}/attack2 ${user_dir}/${dir}/threshold2 ${user_dir}/${dir}/AUC2
rm -r ../AUC/${dir}
rm -r ../AUC/${dir}/AUC ../AUC/${dir}/AUC2
mkdir ../AUC/${dir}
mkdir ../AUC/${dir}/AUC ../AUC/${dir}/AUC2

#noiseの生成
python ../bin/randomnoise.py ${SIM_TIME} ${user_dir}
#シミュレーションの実行
python ../bin/Simulatortest.py ${dataset} ${dir} ${SIM_TIME} $interval $bot_num $loopcount
#TPFPの算出
python ../bin/TPFP.py ${dataset} ${dir} $loopcount
#AUCの算出
python ../bin/AUC.py ${dataset} ${dir}

time=$SECONDS
echo $time

#パラメータとかディレクトリとか
dir="1000_100000ms"
interval=100000

SECONDS=0
mkdir ${user_dir}/${dir}
rm -r ${user_dir}/${dir}/attack ${user_dir}/${dir}/threshold ${user_dir}/${dir}/AUC
rm -r ${user_dir}/${dir}/attack2 ${user_dir}/${dir}/threshold2 ${user_dir}/${dir}/AUC2
mkdir ${user_dir}/${dir}/attack ${user_dir}/${dir}/threshold ${user_dir}/${dir}/AUC
mkdir ${user_dir}/${dir}/attack2 ${user_dir}/${dir}/threshold2 ${user_dir}/${dir}/AUC2
rm -r ../AUC/${dir}
rm -r ../AUC/${dir}/AUC ../AUC/${dir}/AUC2
mkdir ../AUC/${dir}
mkdir ../AUC/${dir}/AUC ../AUC/${dir}/AUC2

#noiseの生成
python ../bin/randomnoise.py ${SIM_TIME} ${user_dir}
#シミュレーションの実行
python ../bin/Simulatortest.py ${dataset} ${dir} ${SIM_TIME} $interval $bot_num $loopcount
#TPFPの算出
python ../bin/TPFP.py ${dataset} ${dir} $loopcount
#AUCの算出
python ../bin/AUC.py ${dataset} ${dir}

time=$SECONDS
echo $time
