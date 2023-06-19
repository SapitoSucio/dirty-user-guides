<figure markdown>
  ![Ragnarok Title System](https://i.imgur.com/VDyQ5Ox.png)
  <figcaption>Ragnarok Title System</figcaption>
</figure>

The Title System in Ragnarok Online allows players to earn titles by completing certain activities or achievements in the game.

These achievements[^1] can include exploring new areas, completing certain quests, reaching certain levels, or defeating powerful bosses.

When a player earns a title, it can be equipped on their character, and it will be displayed before their name, allowing other players to see the special achievements or activities that the player has completed.

[^1]: [Achievement System](https://irowiki.org/wiki/Achievement_System)

## Modifications

### Client Side

On your `System Folder`, open up `achievement_list_EN.lub` file.

Here we will declare a new achievement with the ID of `250000`

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

    If the new achievement you're adding is the last one, you don't need to put a comma at the end, but if you have other achievements under your custom achievement, then you need to put a comma before the last `}`.

On yor `Data Folder`, go to `luafiles514\lua files\datainfo` and open up `titletable.lub` and add append your custom title.

```lua hl_lines="8"
title_tbl = {
    -- Rest of titles
	[1042] = "Undead Slayer",
	[1043] = "Strouf Slayer",
	[1044] = "Sting Slayer",
	[1045] = "Conqueror of Illusion",
	[1046] = "King Maker"
	[1500] = "Froggy Testeru"
}
```
??? info "Remember; TitleID it's one thing and AchievementID it's another thing..."
	Here we declared our custom title with and ID of 1500, previously we declared the AchievementID of 250000, which will reward this "Froggy Testeru" title


### Server Side

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

You can use this NPC Script to give yourself the achievement.

```cpp
prontera,155,179,5	script	FroggoNPC	810,{
	achievementcomplete(250000); //The ID you declared on achievement_list_EN.lub
	end;
}
```
!!! warning "Remember to check the achievement window and claim the reward"

## Extra Information

!!! info "You can create a Title without creating an Achievement"
	But you won't see it in the title window unless you create and complete the achievement that rewards you with the title, otherwise you'll have to find another way to use and apply the title, such as SQL or custom SRC code.