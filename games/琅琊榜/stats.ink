VAR A = 5
VAR B = 5
VAR C = 5
VAR D = 5

=== check_stats
{
    - A <= 0:
        梁帝疑心大起，一纸诏书削去爵位。
        #class: dialog
        赐鸩酒，薨。
        -> END
    - A >= 10:
        功高震主，鸟尽弓藏。
        #class: dialog
        暗中毒杀，死因成谜。
        -> END
    - B <= 0:
        六部联名弹劾，御史台死谏。
        #class: dialog
        废为庶人，圈禁至死。
        -> END
    - B >= 10:
        世家门阀尾大不掉，朝堂尽入私囊。
        文臣反客为主，皇权旁落，天下大乱。
        -> END
    - C <= 0:
        谢玉派兵围剿，禁军无力回天。
        #class: dialog
        死于乱军，赤焰冤案永埋。
        -> END
    - C >= 10:
        拥兵自重，被指谋逆。
        #class: dialog
        背负千古骂名，众叛亲离。
        -> END
    - D <= 0:
        江左盟分崩离析，暗线尽断。
        #class: dialog
        悬镜司介入，真相永无天日。
        -> END
    - D >= 10:
        江湖干政，名门正派群起攻之。
        #class: dialog
        朝廷与江湖联手剿灭，江左盟覆灭。
        -> END
    - else:
        ->->
}
