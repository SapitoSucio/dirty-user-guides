<figure markdown>
  ![Ragnarok Title System](https://i.imgur.com/VDyQ5Ox.png)
  <figcaption>Ragnarok Title System</figcaption>
</figure>

The Title System in Ragnarok Online allows players to earn titles by completing certain activities or achievements in the game.

These achievements[^1] can include exploring new areas, performing specific quests, reaching certain levels, or defeating powerful bosses.

When a player obtains a title, it can be equipped on their character, and it will be displayed before their name, allowing other players to see the special achievements or activities that the player has completed.

[^1]: [Achievement System](https://irowiki.org/wiki/Achievement_System)

## Client Side

On your `System Folder`, open up `achievement_list_EN.lub` file.

Here you have to declare the new achievement

```lua hl_lines="15-30"
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
}
```

!!! info "Remember to include (or not) the comma"

    If the new achievement you are adding it's the last one, you don't need to put a comma at the end, but if you have other achievements below your custom one, then you need to add a comma before the last `}`

On yor `Data Folder`, go to `luafiles514\lua files\datainfo` and open up `titletable.lub` and add append your custom title.

```lua hl_lines="8"
title_tbl = {
    -- Rest of titles
	[1042] = "Undead Slayer",
	[1043] = "Strouf Slayer",
	[1044] = "Sting Slayer",
	[1045] = "Conqueror of Illusion",
	[1046] = "King Maker"
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

And edit `TITLE_MAX` value as you wish, in this case I'll put `2000`

```cpp hl_lines="4"
enum e_title_table : uint16 {
	TITLE_NONE = 0,
	TITLE_BASE = 1000,
	TITLE_MAX = 2000
};
```





## NPC Code

You can use this NPC Script to give yourself the quest, remember to check the achievement window and claim the reward.

```cpp
prontera,155,179,5	script	FroggoNPC	810,{
	achievementcomplete(250000); //The ID you declared on achievement_list_EN.lub
	end;
}
```

!!! info "You can create a Title without creating an Achievement"
	But you won't see it on the Title Window, unless you create and complete the achievement which will reward to you the Title, otherwise you will have to find another way to use and apply the title, like SQL or custom SRC code.