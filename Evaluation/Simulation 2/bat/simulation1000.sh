#パラメータとかディレクトリとか
dir="1000_100ms"
dataset="dataset_1000a.txt"
user_dir="/Users/Kei/Desktop/SimulationData"
SIM_TIME=100
loopcount=99
bot_num=2000
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

dir="1000_200ms"
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

dir="1000_300ms"
user_dir="/Users/Kei/Desktop/SimulationData"
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

dir="1000_400ms"
user_dir="/Users/Kei/Desktop/SimulationData"
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

dir="1000_500ms"
user_dir="/Users/Kei/Desktop/SimulationData"
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

dir="1000_600ms"
user_dir="/Users/Kei/Desktop/SimulationData"
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

dir="1000_700ms"
user_dir="/Users/Kei/Desktop/SimulationData"
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

dir="1000_800ms"
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

dir="1000_900ms"
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

dir="1000_1000ms"
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

dir="1000_1500ms"
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

dir="1000_2000ms"
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

dir="1000_3000ms"
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

dir="1000_4000ms"
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

dir="1000_5000ms"
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

dir="1000_6000ms"
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

dir="1000_7000ms"
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

dir="1000_8000ms"
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

dir="1000_9000ms"
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

dir="1000_10000ms"
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
