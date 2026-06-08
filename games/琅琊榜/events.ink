=== do_event(event_name)
{event_name:
    - "琅琊造势": -> 琅琊造势_event ->
    - "琅琊避嫌": -> 琅琊避嫌_event ->
    - "坦然受之": -> 坦然受之_event ->
    - "称病避嫌": -> 称病避嫌_event ->
    - "暗中联络": -> 暗中联络_event ->
    - "隐匿踪迹": -> 隐匿踪迹_event ->
    - "受邀进京": -> 受邀进京_event ->
    - "秘密进京": -> 秘密进京_event ->
    - "苏哲入京": -> 苏哲入京_event ->
    - "整理情报": -> 整理情报_event ->
    - "调息服药": -> 调息服药_event ->
    - "服用乌金丸": -> 服用乌金丸_event ->
    - "运功压制": -> 运功压制_event ->
    - "亲自拆解": -> 亲自拆解_event ->
    - "交由黎纲": -> 交由黎纲_event ->
    - "暗中查访": -> 暗中查访_event ->
    - "不予理会": -> 不予理会_event ->
    - "放任传播": -> 放任传播_event ->
    - "派人压制": -> 派人压制_event ->
    - "派人探查": -> 派人探查_event ->
    - "暂不理会": -> 暂不理会_event ->
    - "暗中记录": -> 暗中记录_event ->
    - "转移话题": -> 转移话题_event ->
    - "枯井探查": -> 枯井探查_event ->
    - "移尸布局": -> 移尸布局_event ->
    - "暗中监视": -> 暗中监视_event ->
    - "散布谣言": -> 散布谣言_event ->
    - "抚琴传谣": -> 抚琴传谣_event ->
    - "静静听琴": -> 静静听琴_event ->
    - "仔细核对": -> 仔细核对_event ->
    - "采纳建议": -> 采纳建议_event ->
    - "暂缓行动": -> 暂缓行动_event ->
    - "询问沈追": -> 询问沈追_event ->
    - "移交沈追": -> 移交沈追_event ->
    - "藏于苏宅": -> 藏于苏宅_event ->
    - "吟诗作对": -> 吟诗作对_event ->
    - "品茗论道": -> 品茗论道_event ->
    - "下场比试": -> 下场比试_event ->
    - "旁观喝彩": -> 旁观喝彩_event ->
    - "欣然收下": -> 欣然收下_event ->
    - "婉言谢绝": -> 婉言谢绝_event ->
    - "强硬回击": -> 强硬回击_event ->
    - "虚与委蛇_谢玉": -> 虚与委蛇_谢玉_event ->
    - "陪他切磋": -> 陪他切磋_event ->
    - "给他买零食": -> 给他买零食_event ->
    - "活捉审问": -> 活捉审问_event ->
    - "直接击退": -> 直接击退_event ->
    - "接受暗示": -> 接受暗示_event ->
    - "保持距离": -> 保持距离_event ->
    - "正面回击": -> 正面回击_event ->
    - "暂避锋芒": -> 暂避锋芒_event ->
    - "虚与委蛇_誉王": -> 虚与委蛇_誉王_event ->
    - "严词拒绝": -> 严词拒绝_event ->
    - "引蛇出洞": -> 引蛇出洞_event ->
    - "闭门不见": -> 闭门不见_event ->
    - "欣然赴约": -> 欣然赴约_event ->
    - "改日再聚": -> 改日再聚_event ->
    - "透露风声": -> 透露风声_event ->
    - "含糊其辞": -> 含糊其辞_event ->
    - "飞流喝彩": -> 飞流喝彩_event ->
    - "出手试探": -> 出手试探_event ->
    - "公开建言": -> 公开建言_event ->
    - "避嫌自保": -> 避嫌自保_event ->
    - "获得声望": -> 获得声望_event ->
    - "获得兰园线索": -> 获得兰园线索_event ->
    - "获得贪腐线索": -> 获得贪腐线索_event ->
    - "解锁蒙挚": -> 解锁蒙挚_event ->
    - "解锁沈追": -> 解锁沈追_event ->
    - "解锁太子": -> 解锁太子_event ->
    - "谢玉警告触发": -> 谢玉警告触发_event ->
    - "东宫施压触发": -> 东宫施压触发_event ->
    - "誉王监视触发": -> 誉王监视触发_event ->
    - "phase2_end": -> phase2_end_event ->
    - else: ->->
}
-> check_conditions(event_name) ->
->->

= 琅琊造势_event
~ D += 1
~ next_card = (梁帝侧目)
->->

= 琅琊避嫌_event
~ D -= 1
~ next_card = (梁帝侧目)
->->

= 坦然受之_event
~ A += 1
~ next_card = (北境军情)
->->

= 称病避嫌_event
~ A -= 1
~ next_card = (北境军情)
->->

= 暗中联络_event
~ C += 1
~ next_card = (清流议论)
->->

= 隐匿踪迹_event
~ C -= 1
~ next_card = (清流议论)
->->

= 受邀进京_event
~ B += 1
~ next_card = (苏哲入京)
->->

= 秘密进京_event
~ B -= 1
~ next_card = (苏哲入京)
->->

= 苏哲入京_event
~ CARD_LIST += (黎纲汇报, 病发调息, 密信处理, 市井流言, 麒麟热议, 初访妙音坊, 谢玉送礼, 飞流捣乱, 誉王拜访, 萧言邀约)
~ CARD_LIST -= (start)
->->

= 整理情报_event
~ D += 1
->->

= 调息服药_event
~ A += 1
->->

= 服用乌金丸_event
~ A += 1
->->

= 运功压制_event
~ C += 1
->->

= 亲自拆解_event
~ D += 1
->->

= 交由黎纲_event
~ B += 1
->->

= 暗中查访_event
~ D += 1
->->

= 不予理会_event
~ A += 1
~ B += 1
->->

= 放任传播_event
~ B += 1
->->

= 派人压制_event
~ A += 1
->->

= 派人探查_event
~ next_card = (兰园废墟)
->->

= 暂不理会_event
~ A += 1
~ CARD_LIST += (兰园废墟)
->->

= 暗中记录_event
->->

= 转移话题_event
~ A += 1
->->

= 枯井探查_event
~ CARD_LIST += (阴森异动)
~ CARD_LIST -= (兰园废墟)
->->

= 移尸布局_event
~ CARD_LIST += (阴森异动)
~ CARD_LIST -= (兰园废墟)
->->

= 暗中监视_event
~ D += 1
->->

= 散布谣言_event
->->

= 抚琴传谣_event
~ CARD_LIST += (妙音坊听琴, 暗线情报)
~ CARD_LIST -= (初访妙音坊)
->->

= 静静听琴_event
~ A += 1
~ CARD_LIST += (妙音坊听琴, 暗线情报)
~ CARD_LIST -= (初访妙音坊)
->->

= 仔细核对_event
->->

= 采纳建议_event
~ B += 1
~ D += 1
->->

= 暂缓行动_event
~ A += 1
->->

= 询问沈追_event
~ B += 1
->->

= 移交沈追_event
->->

= 藏于苏宅_event
->->

= 吟诗作对_event
~ B += 1
->->

= 品茗论道_event
~ A += 1
->->

= 下场比试_event
~ C += 1
->->

= 旁观喝彩_event
~ A += 1
->->

= 欣然收下_event
~ A -= 1
~ D += 1
->->

= 婉言谢绝_event
~ A += 1
~ B += 1
->->

= 强硬回击_event
~ B -= 1
~ C += 1
->->

= 虚与委蛇_谢玉_event
~ A += 1
~ D -= 1
->->

= 陪他切磋_event
~ C += 1
->->

= 给他买零食_event
~ A -= 1
~ D += 1
->->

= 活捉审问_event
~ C += 1
->->

= 直接击退_event
~ C += 1
->->

= 接受暗示_event
~ A -= 1
~ D += 1
->->

= 保持距离_event
~ A += 1
~ B += 1
->->

= 正面回击_event
~ B -= 1
~ C += 1
->->

= 暂避锋芒_event
~ A += 1
~ D -= 1
->->

= 虚与委蛇_誉王_event
~ B += 1
~ D += 1
->->

= 严词拒绝_event
~ A += 1
~ D -= 1
->->

= 引蛇出洞_event
~ C += 1
->->

= 闭门不见_event
~ A += 1
->->

= 欣然赴约_event
~ B += 1
~ CARD_LIST += (贵族雅集, 骑射邀约)
~ CARD_LIST -= (萧言邀约)
->->

= 改日再聚_event
~ A += 1
~ CARD_LIST += (贵族雅集, 骑射邀约)
~ CARD_LIST -= (萧言邀约)
->->

= 透露风声_event
~ C += 1
~ CARD_LIST += (飞流切磋)
~ CARD_LIST -= (蒙挚夜访)
->->

= 含糊其辞_event
~ A += 1
~ CARD_LIST += (飞流切磋)
~ CARD_LIST -= (蒙挚夜访)
->->

= 飞流喝彩_event
~ C += 1
->->

= 出手试探_event
~ C += 1
->->

= 公开建言_event
~ B += 1
~ CARD_LIST += (户部查账, 证据封存, 户部风波, 兰园异闻)
~ CARD_LIST -= (沈追请托)
->->

= 避嫌自保_event
~ A += 1
~ CARD_LIST += (户部查账, 证据封存, 户部风波, 兰园异闻)
~ CARD_LIST -= (沈追请托)
->->

= 获得声望_event
->->

= 获得兰园线索_event
->->

= 获得贪腐线索_event
->->

= 解锁蒙挚_event
~ CARD_LIST += (蒙挚夜访)
->->

= 解锁沈追_event
~ CARD_LIST += (沈追请托)
->->

= 解锁太子_event
~ CARD_LIST += (太子招揽)
->->

= 谢玉警告触发_event
~ next_card = (谢玉警告)
~ CARD_LIST -= (谢玉送礼)
->->

= 东宫施压触发_event
~ next_card = (东宫施压)
~ CARD_LIST += (飞流抓刺客)
~ CARD_LIST -= (太子招揽)
->->

= 誉王监视触发_event
~ next_card = (誉王监视)
~ CARD_LIST += (飞流抓刺客)
~ CARD_LIST -= (誉王拜访)
->->

= phase2_end_event
->->

