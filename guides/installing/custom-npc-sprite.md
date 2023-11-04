# How to add a custom NPC Sprite

In this tutorial I'll show you how to add a custom NPC sprite to your RO server.

This is the sprite I am going to add.

<figure markdown>
  ![NPC Custom Sample](https://images.weserv.nl/?url=https://i.imgur.com/akvTnQh.png?v=4&default=https://i.imgur.com/akvTnQh.png&maxage=7d&l=9)
  <figcaption>NPC Custom Goku</figcaption>
</figure>

## Requirements

- A custom NPC sprite
- Any text editor

You'll need to modify both the client and server sides.

## Modifications

### Server Side

On `src/map/npc.hpp`, search for

```cpp
 JT_NEW_NPC_3RD_END = 19999,
 NPC_RANGE3_END, // Official: JT_NEW_NPC_3RD_END=19999
```

Add your custom entry above `NPC_RANGE3_END`, you need to assign an unused ID to it, in this case I'll put `JT_GOKU = 30000`.

```cpp hl_lines="3-4"
 JT_NEW_NPC_3RD_END = 19999,

 // Custom
 JT_GOKU = 30000,

 NPC_RANGE3_END, // Official: JT_NEW_NPC_3RD_END=19999
```

Now we open `src/map/script_constants.hpp` and look for the line `export_constant_npc(JT_NEW_NPC_3RD_END);`.

Add your custom entry below it, like this

```cpp hl_lines="3"
 export_constant_npc(JT_ROZ_MQ_SKULD);
 export_constant_npc(JT_NEW_NPC_3RD_END);
 export_constant_npc(JT_GOKU);
 #undef export_constant_npc
```

That's all for the server-side.

!!! info "Remember; After changing code on the emulator you need to recompile"

### Client Side

This guide assumes that you have enabled the `Custom Lua Support` patch[^1] with either WARP or Nemo.

In your `Data Folder/GRF` go to `luafiles514\lua files\cls` and open `jobname.lub` and append your custom NPC like this:

```lua hl_lines="3" title="data\luafiles514\lua files\cls\jobname.lub"
JobNameTable_CLS = {
 -- [jobtbl_CLS.JT_] = "<File Name>"
 [jobtbl_CLS.JT_GOKU] = "Goku",
}
```

In the previous example, we tell the client that the NPC `JT_GOKU` uses the file `Goku.spr`.

Then, in the same folder `luafiles514\lua files\cls`, open the file `npcidentity.lub`.

Here we declare the NPC ID, the same ID we wrote in `src/map/npc.hpp`, which in this case is `30000`.

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
  ![NPC Custom Sample](https://images.weserv.nl/?url=https://i.imgur.com/HPxAEO8.png?v=4&default=https://i.imgur.com/HPxAEO8.png&h=150&w=150&fit=cover&mask=circle&maxage=7d&l=9)
  <figcaption>NPC Custom Goku</figcaption>
</figure>

??? warning "Remember to put both .act and .spr files in the path `data\sprite\¸ó½ºÅÍ`"
	In this case, the client will search for Goku.act and Goku.spr files.

## Extra

Download the example sprite from this tutorial, right here: <https://www.mediafire.com/file/zbpfvt72a6lr7z6/GokuNPC.zip/file>

[^1]: [Custom Lua Support](https://github.com/llchrisll/ROenglishRE/wiki/Addons-and-Customization#custom-lua-support)
