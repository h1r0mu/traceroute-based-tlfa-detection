#ディレクトリをリセットしてからシミュレーション実行
dir="debug"
dataset="dataset_10a.txt"
user_dir="/Users/Kei/Desktop/SimulationData"
SIM_TIME=100
loopcount=10
bot_num=200
interval=1000

mkdir ${user_dir}/${dir}
rm -r ${user_dir}/${dir}/attack ${user_dir}/${dir}/threshold ${user_dir}/${dir}/AUC
rm -r ${user_dir}/${dir}/attack2 ${user_dir}/${dir}/threshold2 ${user_dir}/${dir}/AUC2
mkdir ${user_dir}/${dir}/attack ${user_dir}/${dir}/threshold ${user_dir}/${dir}/AUC
mkdir ${user_dir}/${dir}/attack2 ${user_dir}/${dir}/threshold2 ${user_dir}/${dir}/AUC2
mkdir ../AUC/${dir}
mkdir ../AUC/${dir}/AUC ../AUC/${dir}/AUC2

#シミュレーションの実行
# python TPFPSimulator.py test/attack test/noise test/burst 100
# python Simulatortest.py test/attack test/noise test/burst 100
python ../bin/randomnoise.py ${SIM_TIME} ${user_dir}
python ../bin/Simulatortest.py ${dataset} ${dir} ${SIM_TIME} $interval $bot_num $loopcount
# python NetworkSimulator.py
#TPFPの算出
python ../bin/TPFP.py ${dataset} ${dir} $loopcount
#AUCの算出
python ../bin/AUC.py ${dataset} ${dir}
