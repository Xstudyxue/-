#!/bin/bash
#贪吃蛇小游戏
#使用ASDW控制移动
#为得到更流畅的控制手感，使用单独的进程接收用户输入，使用信号量传递给游戏主进程

#游戏界面大小
width=40
height=20

#游戏主区域
#0：空地    1：墙    2：结束标记
  map0=(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2)
  map1=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
  map2=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
  map3=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
  map4=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
  map5=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
  map6=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
  map7=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
  map8=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
  map9=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map10=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map11=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map12=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map13=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map14=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map15=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map16=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map17=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map18=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2)
map19=(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2)


#蛇的位置（右头左尾） 蛇在地图中的值为4
#由于shell数组的特殊性，这里设置两个变位定义头尾位置
head=1
tail=0
snake_x=(20 21)
snake_y=(10 10)
snake=4

#食物信息 地图中的值为3
food=3
food_x=20
food_y=5
old_food_x=20
old_food_y=5

#游戏信息
#分数
score=0
#移动方向：1-4对于上下左右
moveDirection=4
#食物有没有吃到
eat=0
#食物有没有被做出来（吃掉后等待在界面中更新）
made=1
#游戏外部shell进程号
edge=$$
#游戏主程序进程号(暂时用edge值替代)
main=$$

#游戏开始界面
function startUI()
{
    clear
    echo -e "\e[1;31m           贪吃蛇\e[0m"
    echo
    echo -e "\033[37;31;5m         按F键开始游戏...\033[39;49;0m"
}

#游戏开始
function start()
{
    startUI
}
start &

#向界面加入蛇和食物
#初始化二者位置
function add()
{
    n=-1
    for x in ${snake_x[@]};
    do
       let n++
       [ $n -eq 0 ] && continue
       eval 'y=${snake_y['"$n"']}'
       eval 'let map'"$y"'['"$x"']+='"$snake"
    done
    x=$food_x
    y=$food_y
    eval 'let map'"$y"'['"$x"']+='"$food"
}

#显示游戏界面
#此方法兼顾检测吃到食物与撞墙
function gameUI()
{
    clear
    for((y=0;y<height;y++));
    do
        eval 'temp=("${map'"$y"'[@]}")'
        for data in ${temp[@]}
        do
            case $data in
            [0])
                   printf "\033[47;32m \e[0m"
            ;;
            [1])
                   printf "\033[44;32m#\e[0m"
            ;;
            [$food])
                   printf "\033[43;37m@\e[0m"
            ;;
            [$snake])
                   printf "\033[42;37m~\e[0m"
            ;;
            [$(($food+$snake))])
                   printf "\033[46;37m~\e[0m"
                   made=0
                   eat=1
                   let score+=5
            ;;
            [2])
                   echo
            ;;
            *)
                   kill -35 $edge
            ;;
            esac
        done
    done
    echo
    echo -n "您的分数："
    echo $score
}

#蛇的移动
#先根据移动方向确定头的新位置；身体不需要改变；根据有没有吃到食物改变尾位置。
#仅更新位置坐标，不在界面中改变
function move()
{
    let head++
    case $moveDirection in
    [1])
        snake_x[$head]=${snake_x[$(($head-1))]}
        snake_y[$head]=$((${snake_y[$(($head-1))]}-1))
    ;;
    [2])
        snake_x[$head]=${snake_x[$(($head-1))]}
        snake_y[$head]=$((${snake_y[$(($head-1))]}+1))
    ;;
    [3])
        snake_y[$head]=${snake_y[$(($head-1))]}
        snake_x[$head]=$((${snake_x[$(($head-1))]}-1))
    ;;
    [4])
        snake_y[$head]=${snake_y[$(($head-1))]}
        snake_x[$head]=$((${snake_x[$(($head-1))]}+1))
    ;;
    esac
    [ $eat -eq 0 ] && unset snake_x[$tail] && unset snake_y[$tail] && let tail++
}

#食物生成
#同样仅确定位置
function make()
{
    [ $eat -eq 0 ] && return
    eval 'let map'"$food_y"'['"$food_x"']-='"$food"
    while [ $eat -eq 1 ] ;
    do
        newFood_x=$(( $RANDOM%$width ))
        newFood_y=$(( $RANDOM%$height ))
        eval '[ ${map'"$newFood_y"'['"$newFood_x"']} -eq 0 ]' && food_x=$newFood_x && food_y=$newFood_y && eat=0
    done
}

#更新蛇和食物的位置
function change()
{
    x=${snake_x[$head]}
    eval 'y=${snake_y['"$head"']}'
    eval 'let map'"$y"'['"$x"']+='"$snake"
    x=${snake_x[$tail]}
    eval 'y=${snake_y['"$tail"']}'
    eval '[ ${map'"$y"'['"$x"']} -eq '"$snake"' ]' && eval 'let map'"$y"'['"$x"']-='"$snake"
    [ $made -eq 0 ] && x=$food_x && y=$food_y && eval 'let map'"$y"'['"$x"']+='"$food" && made=1    
}

#游戏结束
function gameOver()
{
    kill -9 $main
    clear
    echo
    echo "game over."
    echo "按CTRL+C退出游戏"
}


#接收到指定信号启动结束游戏方法
trap "gameOver" 35

#游戏主程序
function mainProgram()
{
    trap "moveDirection=1" 37
    trap "moveDirection=2" 38
    trap "moveDirection=3" 39
    trap "moveDirection=4" 40
    add
    while :;
    do
        gameUI
        sleep 0.3
        move
        make
        change
        let score+=1
    done
}

#游戏启动器
function launcher()
{
    mainProgram &
    main=$!
}
#接收到指定信号启动游戏
trap "launcher" 36

#输入监视程序
function watchOver()
{
    while :;
    do
        read -s -n 1 input;
        [[ $input = "f" ]] && kill -36 $edge
        [[ $input = "w" ]] && kill -37 $main
        [[ $input = "s" ]] && kill -38 $main
        [[ $input = "a" ]] && kill -39 $main
        [[ $input = "d" ]] && kill -40 $main
    done
}
#前台运行，接收用户输入
watchOver

