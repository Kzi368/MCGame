# Lectern snapshot

## Data pack

`@data_pack pack.mcmeta`

```json
{
  "pack": {
    "pack_format": 15,
    "description": ""
  }
}
```

### mcgame

`@function(strip_final_newline) mcgame:mcgame_hola_main`

```mcfunction
particle flame
```

`@function mcgame:main`

```mcfunction
function mcgame:entity_main
schedule function mcgame:main 1
```

`@function mcgame:entity_main`

```mcfunction
"# hi"
execute as @e[tag=mcgame_hola, type=zombie] at @s run function mcgame:mcgame_hola_main
```

`@function mcgame:load`

```mcfunction
function mcgame:main
```

### demo

`@function(strip_final_newline) demo:load`

```mcfunction

```

`@function demo:summon`

```mcfunction
summon zombie ~2 ~ ~ {Glowing: 1b, Passengers: [{id: "minecraft:marker", UUID: [I; 0, 0, 0, 0]}]}
execute as 00000000-0000-0000-0000-000000000000 run function demo:summon/nested_execute_0
```

`@function demo:summon/nested_execute_0`

```mcfunction
execute on vehicle run tag @s add mcgame_hola
kill @s
```

### minecraft

`@function_tag minecraft:load`

```json
{
  "values": [
    "mcgame:load"
  ]
}
```
