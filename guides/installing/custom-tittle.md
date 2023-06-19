
![Ragnarok Title System](https://i.imgur.com/VDyQ5Ox.png){ align=left }

Titles, as the name suggests, are titles prefixed to your character name.

## Client Side

On your `System Folder`, open up `achievement_list_EN.lub`

Here you have to declare the new achievement

```lua hl_lines="15-29"
[240020] = {
    UI_Type = 0,
    group = "GOAL_ACHIEVE",
    major = 6,
    minor = 0,
    title = "Reach Base Level 20",
    content = {
        summary = "Reach Base Level 20",
        details = "Reach Base Level 20. You will be rewarded with a title."
    },
    resource = { [1] = { text = "Reach Base Level 20" } },
    reward = { title = 1024, buff = 12, item = 644 },
    score = 10
},
[250000] = {
    UI_Type = 0,
    group = "GOAL_ACHIEVE",
    major = 6,
    minor = 0,
    -- Achievement title
    title = "Froggy Achievement", 
    content = {
        summary = "Froggy Reward",
        details = "You the best Froggy. You will be rewarded with a title."
    },
    resource = { [1] = { text = "Be the best Froggy" } },
    -- Here you declare your custom TitleID 🐸
    reward = { title = 1500 }, 
    score = 0
},
```

On yor `Data Folder`, go to `luafiles514\lua files\datainfo` and open up `titletable.lub`

```lua hl_lines="5"
title_tbl = {
    -- Rest of titles
	[1045] = "Conqueror of Illusion",
	[1046] = "King Maker",
	[1500] = "Froggo Tester"
}
```


## Server Side

On `achievement.hpp`, search for

```cpp
enum e_title_table : uint16 {
	TITLE_NONE = 0,
	TITLE_BASE = 1000,
	TITLE_MAX = 1046
};
```

edit `TITLE_MAX` value as you wish, in this case I'll put `2000`

```cpp hl_lines="4"
enum e_title_table : uint16 {
	TITLE_NONE = 0,
	TITLE_BASE = 1000,
	TITLE_MAX = 2000
};
```