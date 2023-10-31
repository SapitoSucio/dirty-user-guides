# How to add a custom NPC Sprite

In this tutorial, I'm gonna show you how to add a custom NPC Sprite to your RO Server.

This is the sprite I will be adding.

<figure markdown>
  ![NPC Custom Sample](https://i.imgur.com/0wWj5eH.png)
  <figcaption>NPC Custom Goku</figcaption>
</figure>

## Requirements

- A custom NPC Sprite
- Any text editor

You'll need to modify both client and server side.

## Modifications

### Server Side

On `src/map/npc.hpp`, search for

```cpp
 JT_NEW_NPC_3RD_END = 19999,
 NPC_RANGE3_END, // Official: JT_NEW_NPC_3RD_END=19999
```

Add your custom entry above `NPC_RANGE3_END`, you need to assign an unused ID to it, in this case I'll put `JT_GOKU = 30000`

```cpp hl_lines="3-4"
 JT_NEW_NPC_3RD_END = 19999,

 // Custom
 JT_GOKU = 30000,

 NPC_RANGE3_END, // Official: JT_NEW_NPC_3RD_END=19999
```

Now we open up `src/map/script_constants.hpp` and search for the line `export_constant_npc(JT_NEW_NPC_3RD_END);`

Below it you will add your custom entry, like this:

```cpp hl_lines="3"
 export_constant_npc(JT_ROZ_MQ_SKULD);
 export_constant_npc(JT_NEW_NPC_3RD_END);
 export_constant_npc(JT_GOKU);
 #undef export_constant_npc
```

That's all for the server-side.

!!! info "Remember; After changing code on the emulator you need to recompile"

### Client Side

This guide will be considering you have activated the patch "Custom Lua Support"[^1] with either WARP or Nemo.

On your `Data Folder`, go to `luafiles514\lua files\cls` and open up `jobname.lub` and append your custom NPC like this:

```lua hl_lines="3" title="data\luafiles514\lua files\cls\jobname.lub"
JobNameTable_CLS = {
 -- [jobtbl_CLS.JT_] = "<File Name>"
 [jobtbl_CLS.JT_GOKU] = "Goku",
}
```

With the previous example, we are telling the client that the NPC `JT_GOKU` uses the file `Goku.spr`

Then, on the same folder `luafiles514\lua files\cls`, open up `npcidentity.lub` file.

Here we will declare the NPC ID, the same ID we used wrote on `src/map/npc.hpp`, which in this case is `30000`

```lua hl_lines="6" title="data\luafiles514\lua files\cls\npcidentity.lub"
jobtbl_CLS = {
	-- (NPC: same as in npc.hpp)
	-- JT_ = <Mob ID>
	-- JT_REGINLEIF_MJ = 20514,
	-- JT_INGRID_MJ = 20515
	JT_GOKU = 30000,
}
```

And that's it, easy as that 🐸👌

## NPC Code

You can use your new NPC Sprite this way

```cpp
prontera,155,179,5	script	FroggoNPC	Goku,{
	mes "Kamehamehamehamehamehamehamehamehamehamehame~";
	end;
}
```

<figure markdown>
  ![NPC Custom Sample](https://i.imgur.com/HPxAEO8.png)
  <figcaption>NPC Custom Goku</figcaption>
</figure>

??? warning "Remember to place both .act and .spr files on the path `data\sprite\¸ó½ºÅÍ`"
	In this case, the client will be looking for Goku.act and Goku.spr files

## Extra

Download the example sprite from this tutorial, right here: <https://www.mediafire.com/file/zbpfvt72a6lr7z6/GokuNPC.zip/file>

[^1]: [Custom Lua Support](https://github.com/llchrisll/ROenglishRE/wiki/Addons-and-Customization#custom-lua-support)
