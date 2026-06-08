=== check_conditions(event_name)
{event_name:
    - "抚琴传谣":
        { do_event.抚琴传谣_event >= 1 && do_event.抚琴传谣_event < 2:
            -> do_event("获得声望") ->
        }
    - "吟诗作对":
        { do_event.吟诗作对_event >= 1 && do_event.吟诗作对_event < 2 && do_event.品茗论道_event < 1 && do_event.下场比试_event < 1 && do_event.旁观喝彩_event < 1:
            -> do_event("获得声望") ->
        }
    - "品茗论道":
        { do_event.品茗论道_event >= 1 && do_event.吟诗作对_event < 1 && do_event.品茗论道_event < 2 && do_event.下场比试_event < 1 && do_event.旁观喝彩_event < 1:
            -> do_event("获得声望") ->
        }
    - "下场比试":
        { do_event.下场比试_event >= 1 && do_event.吟诗作对_event < 1 && do_event.品茗论道_event < 1 && do_event.下场比试_event < 2 && do_event.旁观喝彩_event < 1:
            -> do_event("获得声望") ->
        }
    - "旁观喝彩":
        { do_event.旁观喝彩_event >= 1 && do_event.吟诗作对_event < 1 && do_event.品茗论道_event < 1 && do_event.下场比试_event < 1 && do_event.旁观喝彩_event < 2:
            -> do_event("获得声望") ->
        }
    - "获得声望":
        { do_event.获得声望_event >= 1 && do_event.解锁蒙挚_event < 1:
            -> do_event("解锁蒙挚") ->
        }
    - "获得声望":
        { do_event.获得声望_event >= 1 && do_event.解锁沈追_event < 1:
            -> do_event("解锁沈追") ->
        }
    - "获得声望":
        { do_event.获得声望_event >= 1 && do_event.谢玉警告触发_event < 1 && do_event.解锁太子_event < 1:
            -> do_event("解锁太子") ->
        }
    - "枯井探查":
        { do_event.枯井探查_event >= 1:
            -> do_event("获得兰园线索") ->
        }
    - "移尸布局":
        { do_event.移尸布局_event >= 1:
            -> do_event("获得兰园线索") ->
        }
    - "暗中记录":
        { do_event.暗中记录_event >= 1:
            -> do_event("获得贪腐线索") ->
        }
    - "仔细核对":
        { do_event.仔细核对_event >= 1:
            -> do_event("获得贪腐线索") ->
        }
    - "移交沈追":
        { do_event.移交沈追_event >= 1:
            -> do_event("获得贪腐线索") ->
        }
    - "藏于苏宅":
        { do_event.藏于苏宅_event >= 1:
            -> do_event("获得贪腐线索") ->
        }
    - "婉言谢绝":
        { do_event.婉言谢绝_event >= 2 && do_event.谢玉警告触发_event < 1:
            -> do_event("谢玉警告触发") ->
        }
    - "保持距离":
        { do_event.保持距离_event >= 1 && do_event.东宫施压触发_event < 1:
            -> do_event("东宫施压触发") ->
        }
    - "严词拒绝":
        { do_event.严词拒绝_event >= 1 && do_event.誉王监视触发_event < 1:
            -> do_event("誉王监视触发") ->
        }
    - "获得兰园线索":
        { do_event.获得兰园线索_event >= 1 && do_event.获得贪腐线索_event >= 2:
            -> do_event("phase2_end") ->
        }
    - else: ~ temp _dummy = 0
}

->->

