#!/bin/bash
declare -i num
declare -i s
a=(
0 0 1 1 1 0 0 0 9 0 0 1 4 1 0 0 0 9 0 0 1 3 1 1 1 1 9 1 1 1 0 0 3 4 1 9 1 4 0 3 2 1 1 1 9 1 1 1 1 3 1 0 0 9 0 0 0 1 4 1 0 0 9 0 0 0 1 1 1 0 0 9
)
main(){
	    while true
		        do
				        clear
					        echo "===================推箱子=================="
						        echo "====游戏规则：将星星全部推到终结符处，即为胜利===="
							        echo "==w:向上推 s:向下推 a:向左推 d:向右推 输入字符后回车执行=="
								        show
									        move
										        np=0
											        for n in ${!a[@]}
													        do
															            if [ ${a[$n]} -eq 3 ]; then
																	                    np=$(( np+1 ))
																			                fi
																					        done
																						        if [ $np -gt 0 ]; then
																								            echo "continue"
																									            else
																											                break
																													        fi
																														    done
																														        echo "you are win!"
																														}
																														show()
																														{
																															    for data in "${a[@]}";
																																        do
																																		        case $data in
																																				            [0])
																																						                    printf " "
																																								                    #空白
																																										                    ;;
																																												                [1])
																																															                printf "■"
																																																	                #墙
																																																			                ;;
																																																					            [2])
																																																							                    printf "♀"
																																																									                    #人
																																																											                    ;;
																																																													                [3])
																																																																                printf "☆"
																																																																		                #箱子
																																																																				                ;;
																																																																						            [4])
																																																																								                    printf "◎"
																																																																										                    #终点
																																																																												                    ;;
																																																																														                [5])    
																																																																																	                printf "♂"
																																																																																			                #人+终点
																																																																																					                ;;
																																																																																							            [6])
																																																																																									                    printf "★"
																																																																																											                    #箱子+终点
																																																																																													                    ;;
																																																																																															                [9])
																																																																																																		                printf "\n"
																																																																																																				                ;;
																																																																																																						        esac
																																																																																																							    done        
																																																																																																						    }
																																																																																																						    function move()
																																																																																																						    {
																																																																																																							        for i in ${!a[@]}
																																																																																																									    do  
																																																																																																										            if [ ${a[$i]} -eq 2 -o ${a[$i]} -eq 5 ]; then
																																																																																																												                #找到自己
																																																																																																														            num=$i
																																																																																																															                break  
																																																																																																																	        fi 
																																																																																																																		    done
																																																																																																																		        read dir
																																																																																																																			    case $dir in
																																																																																																																				            "w")
																																																																																																																						                #上
																																																																																																																								            if [ "${a[num-9]}" -eq 0  ]; then
																																																																																																																										                    a[num-9]=2
																																																																																																																												                    a[num]=0
																																																																																																																														                elif [ "${a[num-9]}" -eq 3 ]; then
																																																																																																																																	                if [ "${a[num-18]}" -eq 0 ]; then
																																																																																																																																				                    a[num-9]=2
																																																																																																																																						                        a[num]=0
																																																																																																																																									                    a[num-18]=3
																																																																																																																																											                    elif [ "${a[num-18]}" -eq 4 ]; then
																																																																																																																																														                        a[num-9]=2
																																																																																																																																																	                    a[num]=0
																																																																																																																																																			                        a[num-18]=6
																																																																																																																																																						                fi
																																																																																																																																																								            elif [ "${a[num-9]}" -eq 4 ]; then
																																																																																																																																																										                    a[num-9]=5
																																																																																																																																																												                    a[num]=0
																																																																																																																																																														                fi
																																																																																																																																																																            ;;
																																																																																																																																																																	            "a")
																																																																																																																																																																			                #左
																																																																																																																																																																					            if [ "${a[num-1]}" -eq 0  ]; then
																																																																																																																																																																							                    a[num-1]=2
																																																																																																																																																																									                    a[num]=0
																																																																																																																																																																											                elif [ "${a[num-1]}" -eq 3 ]; then
																																																																																																																																																																														                if [ "${a[num-2]}" -eq 0 ]; then
																																																																																																																																																																																	                    a[num-1]=2
																																																																																																																																																																																			                        a[num]=0
																																																																																																																																																																																						                    a[num-2]=3
																																																																																																																																																																																								                    elif [ "${a[num-2]}" -eq 4 ]; then
																																																																																																																																																																																											                        a[num-1]=2
																																																																																																																																																																																														                    a[num]=0
																																																																																																																																																																																																                        a[num-2]=6
																																																																																																																																																																																																			                fi
																																																																																																																																																																																																					            elif [ "${a[num-1]}" -eq 4 ]; then
																																																																																																																																																																																																							                    a[num-1]=5
																																																																																																																																																																																																									                    a[num]=0
																																																																																																																																																																																																											                fi
																																																																																																																																																																																																													            ;;
																																																																																																																																																																																																														            "d")
																																																																																																																																																																																																																                #右
																																																																																																																																																																																																																		            if [ "${a[num+1]}" -eq 0  ]; then
																																																																																																																																																																																																																				                    a[num+1]=2
																																																																																																																																																																																																																						                    a[num]=0
																																																																																																																																																																																																																								                elif [ "${a[num+1]}" -eq 3 ]; then
																																																																																																																																																																																																																											                if [ "${a[num+2]}" -eq 0 ]; then
																																																																																																																																																																																																																														                    a[num+1]=2
																																																																																																																																																																																																																																                        a[num]=0
																																																																																																																																																																																																																																			                    a[num+2]=3
																																																																																																																																																																																																																																					                    elif [ "${a[num+2]}" -eq 4 ]; then
																																																																																																																																																																																																																																								                        a[num+1]=2
																																																																																																																																																																																																																																											                    a[num]=0
																																																																																																																																																																																																																																													                        a[num+2]=6
																																																																																																																																																																																																																																																                fi
																																																																																																																																																																																																																																																		            elif [ "${a[num+1]}" -eq 4 ]; then
																																																																																																																																																																																																																																																				                    a[num+1]=5
																																																																																																																																																																																																																																																						                    a[num]=0
																																																																																																																																																																																																																																																								                fi
																																																																																																																																																																																																																																																										            ;;  
																																																																																																																																																																																																																																																											            "s")
																																																																																																																																																																																																																																																													                #下
																																																																																																																																																																																																																																																															            if [ "${a[num+9]}" -eq 0  ]; then
																																																																																																																																																																																																																																																																	                    a[num+9]=2
																																																																																																																																																																																																																																																																			                    a[num]=0
																																																																																																																																																																																																																																																																					                elif [ "${a[num+9]}" -eq 3 ]; then
																																																																																																																																																																																																																																																																								                if [ "${a[num+18]}" -eq 0 ]; then
																																																																																																																																																																																																																																																																											                    a[num+9]=2
																																																																																																																																																																																																																																																																													                        a[num]=0
																																																																																																																																																																																																																																																																																                    a[num+18]=3
																																																																																																																																																																																																																																																																																		                    elif [ "${a[num+18]}" -eq 4 ]; then
																																																																																																																																																																																																																																																																																					                        a[num+9]=2
																																																																																																																																																																																																																																																																																								                    a[num]=0
																																																																																																																																																																																																																																																																																										                        a[num+18]=6
																																																																																																																																																																																																																																																																																													                fi
																																																																																																																																																																																																																																																																																															            elif [ "${a[num+9]}" -eq 4 ]; then
																																																																																																																																																																																																																																																																																																	                    a[num+9]=5
																																																																																																																																																																																																																																																																																																			                    a[num]=0
																																																																																																																																																																																																																																																																																																					                fi
																																																																																																																																																																																																																																																																																																							            ;;  
																																																																																																																																																																																																																																																																																																								        esac
																																																																																																																																																																																																																																																																																																								}
																																																																																																																																																																																																																																																																																																								main
																																																																																																																																																																																																																																																																																																								show
																																																																																																																																																																																																																																																																																																								move
