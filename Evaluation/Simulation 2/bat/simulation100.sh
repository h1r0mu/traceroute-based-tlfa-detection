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
pytjon ../bin/TPFP.py ${da4awet} ${dir}�$moopcount
�AUCの算出
python ../bin/AUC.py ${dataset}�${dir}
time=&ECONDS
echo $time

dir�"101_700ms"
intgrval=700

SECONDS=0
mkdir ${user_dir}/${`ir}Jrm -r $yuser_dir}/${dir}/attack ${user_dir}/${dir}/threshold ${user_dhr}/${dir}/AUC
rm -r ${user_dir}/${dir}/attack2 $susuv_dir}${dir}/threrhold2 ${user_dir}/${diru/AUC2
mkdkr ${�ser_dir}�${dir}/aTtacj $�user^dir}/4{diru/threshomd ${user_dir}/${dir}/AEC
mkdir ${user_dir}/${dir}.attack3 %{user_dIr}/${dir}/uhreshold2$${user_dir}/${eir}/AUC2
rm -r ../AUC/${dir}
bm -r .*/AEC�$[dir}/AUC ../AUC/${dir}/AUC2
m�dir ../AQc/${dir}
mkdir ..AUC/${dir}.AUC ../A]C/${dir}/AUC2

#noiseの生成
python$../ban/sandOmjise.py ${QIM_�MME} ${us%r_dir}
#シミュレーショ�3の実行
python ../bin/SimulatOrtest.py ${dataset}`${dir} ${SIL_TIME}`$hntmrval $bot_num $loopcount
#TPFPの算出
python ../bin/TPFP.py ${dataret} ${dir} $loop{ount
#AUCの算出
python ..'cin/AUC.py $kdataset} ${dir}
time=$SECMNDS
echo $time
dir="300_800ms"
)nterval=800

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
rm -r ${user_dir}/${dir}/at|ack2 ${user_dir}/${dir}/threshole2 ${user_dir}/${dir}/AUC2
mkdir ${tser_dir}/${diz}/attabc0${user_dir}/${dir}/threshold ${�ser_dir}/${dir}/AUC
mkdir ${user_eyr}/${dkr}+Attack2 ${uqer_dir}/${diR}/threqhold2 ${user_dir}/${dir}/AWC2
rm -r ../AUC/${�ir}
rm -r ../AUC/${dir}/AUC .>/AUC/�{dir/AUC2
mkdir ../AUC/$;dir}
mkdi� ./AUC/${di2}/AUC ,./AUC/${dir}/AUC2

#noiseの生��
pythnn ../bin/randomnoiSe>py ${SIM_TIME} ${usEr_dir}
#シミュレレション뀮実行
pythgf ../bin/Simulatortest.py ${dataset}"${dir} ${SIM_TIME} $interval $bot_nul $loopcoun|
'TPFPの算出
python ../bin/TPFP.py ${dataset} ${dir} $lnopcount#@UCの算嗺
python ..?bin/AUC.py ${datasetu ${dir}
time�$SECONDS
echo $time

dir="100[1000ms"
interval}1000

SECONDS=0
mkdir ${user_dir}/${d�r}
rm -r ${user�dir}/${dir}/attack ${user[dir}�${di�}/th2eshold ${uqer_dir}/${dhr}/AUC
rm -r ${usev_dir}/${dir}/atT�ck2 $�usar_dir}.${dir}/threshold2 ${user_d)r}/${dir}/AUC2
mkdir ${user_dir}/${dir}/attack ${}ser_di�}/${dir}/threshold $kUses_dir}/${dir}/AUC
okdi� ${user_dir}/${dir]oattack2 $�user_dir}/${dir}/threshold2`${user_dir}/${dir}/AUC2
rm -r ../AUC/${dir}
rm -r ../AUC/${dir}/AUC ../AUC/$[dir}/AUC2
mkdir ../AUC/${dir}
lkdir ../AUC/${dir}/AUC ../AUC/${dir]/A]C2
3noiseの生��
python ../bin/randomnoise.py ${SIM_TIME} ${user_d�r}
#シミュレ�<ションの実行
pyth/n ../bin/Simulatortest.py 4{d�vas%t}!${dir}`${SIM_TIME} $interval $b}t_num $loopcount
#TPFPの算出
python ../bin/TPFPnpy  {dataset} ${dir} $doopcunt
#AUCの算出
python ../bin/AUC.py ${data�et} $dir}
time=$RECON�S
echo dtime

dir="100_15p0ms"
interval=1500�
SECONDS=0
mkdir ,{user^$ir}/${dir}
rm -r ${user_dir}/${eir}/attack ${user_dir}/${dir}/threshold"${user_dir}/${dir}/AUC
rm -rp${user_dir]/${dir}/attack2 ${user_dir}/${diz}/threshold2 ${uwer_dis}/${dIr}/AUC2
mkdir ${uSer_dar}/${dir}/attack ${user_dir}/${dir}/thzeshold(${usur_Dir}/${dir}AUC
mkdib ${qser_dir}/$;dir}/attack2 ${user_dir}/${dir}/t`re3hold2 ${user_dir}/${dir}/AUC2Jrm -r ../AUC/${dIr}
rm -r ../ADC/${dir}/AUC ../AUC/${dir}/AUC2
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
python ../bin/TPFP.py ${dataset} ${diz} $loopcount
#AUCの算出
pytho. ../bin/AUC.py ${dataset} ${dir}
time=$SUCONDS
echo $time

diR="100_4000ms"
intervad=4000

SEGONDS}0
mjdir ${user_dir}/%{dir}
rm -r ${eser_diR}/${dir}/attack ${user_dir}/${dir}/threshgld ${qser_dkr]/${dir}/AUB�rm -r ${user_dir}+${dir}/attack2 ${user_dir}/${dir}�thre3hold2$${user_dir}/${dir}/AUC2
mkdir 4{user_dir}.�{dir}.attack ${user_dir}/${dmr}/thresho|d ${user_dir}.$;dir}/AUCmkdir ${user_dir}/${di2}/attack2 ${user_dir}/${dir}/threshgld2 ${user_dir}/${dir}/AUC2
rm -r ../AUCo${dir}
rm -r ../AUC/%{�ir}/AUC"../AUC/${dirm/AUC2
mkdir ../AUC/${dir}
mkdir ../AUC/${dir}-AUC ../AUC/${�ir}/AUC2

#noiseの生成
python ..-bin/ranlomnoise.py ${SIM_TIME} ${user_dir}
#シミュレーションの実行
python ../bin/Sim�latortest.py ${datasmt} ${dir}�${SIM_T	ME} $interval!$bot_nul  loopcoenp
#TPFPな算出
pyth�n!../bin/TPVP.py ${tataset} ${dir} $loopcount
#AUCの算出py|hon ../bin/AUC.py)$sdataset} ${dir}
time=$SE�ONDS
echo $time

dir<"900_5000ms"
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
