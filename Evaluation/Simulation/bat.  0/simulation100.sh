#パラメータとかディレクトリとか
dir="100_5ms"
dataset="dataset_100a.txt"
user_dir="/Users/Kei/Desktop/SimulationData"
SIM_TIME=100
loopcount=99
bot_num=200
interval=5

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

dir="100_100ms"
interval=100

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

dir="100_200ms"
interval=200

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

dir="100_300ms"
interval=300

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

dir="100_400ms"
interval=400

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

dir="100_500ms"
interval=500

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

dir="100_600ms"
interval=600

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

dir="100_700ms"
interval=700

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

dir="100_800ms"
interval=800

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

dir="100_900ms"
interval=900

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

dir="100_1000ms"
interval=1000

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

dir="100_1500ms"
interval=1500

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

dir="100_2000ms"
interval=2000

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

dir="100_3000ms"
interval=3000

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

dir="100_4000ms"
interval=4000

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

dir="100_5000ms"
interval=5000

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

dir="100_6000ms"
interval=6000

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

dir="100_7000ms"
interval=7000

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

dir="100_8000ms"
interval=8000

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

dir="100_9000ms"
interval=9000

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

dir="100_10000ms"
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
