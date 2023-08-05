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

`@function mcgame:mcgame_custom_1_spawn`

```mcfunction

particle explosion
```

`@function mcgame:mcgame_custom_1_main`

```mcfunction

particle flame ~ ~1 ~
```

`@function mcgame:mcgame_custom_2_spawn`

```mcfunction

playsound entity.enderman.teleport master @a
```

`@function mcgame:mcgame_custom_2_main`

```mcfunction

```

`@function mcgame:mcgame_custom_3_spawn`

```mcfunction

particle explosion
```

`@function mcgame:mcgame_custom_3_main`

```mcfunction

particle flame ~ ~1 ~
particle explosion
```

`@function mcgame:mcgame_custom_4_spawn`

```mcfunction

playsound entity.enderman.teleport master @a
```

`@function mcgame:mcgame_custom_4_main`

```mcfunction

```

`@function mcgame:main`

```mcfunction
function mcgame:entity_main
schedule function mcgame:main 1
```

`@function mcgame:entity_main`

```mcfunction
# hi
execute as 00000000-0000-0000-0000-000000000000 on passengers run function mcgame:entity_main/nested_execute_1
execute as 00000000-0000-0000-0000-000000000001 on passengers run function mcgame:entity_main/nested_execute_3
execute as 00000000-0000-0000-0000-000000000002 on passengers run function mcgame:entity_main/nested_execute_5
execute as 00000000-0000-0000-0000-000000000003 on passengers run function mcgame:entity_main/nested_execute_7
```

`@function mcgame:load`

```mcfunction
function mcgame:entity_load
function mcgame:main
```

`@function mcgame:entity_load`

```mcfunction
forceload add 500004 500004
scoreboard objectives add owner_is_alive dummy
scoreboard objectives add kill_queue dummy
execute positioned 500004 0 500004 run summon minecraft:item_display ~ ~ ~ {Tags: ["mcgame_core_entity"], UUID: [I; 0, 0, 0, 0]}
execute positioned 500004 0 500004 run summon minecraft:item_display ~ ~ ~ {Tags: ["mcgame_core_entity"], UUID: [I; 0, 0, 0, 1]}
execute positioned 500004 0 500004 run summon minecraft:item_display ~ ~ ~ {Tags: ["mcgame_core_entity"], UUID: [I; 0, 0, 0, 2]}
execute positioned 500004 0 500004 run summon minecraft:item_display ~ ~ ~ {Tags: ["mcgame_core_entity"], UUID: [I; 0, 0, 0, 3]}
```

`@function mcgame:entity_main/nested_execute_0`

```mcfunction
scoreboard players set #logic owner_is_alive 1
function mcgame:mcgame_custom_1_main
```

`@function mcgame:entity_main/nested_execute_1`

```mcfunction
scoreboard players set #logic owner_is_alive 0
execute on origin at @s run function mcgame:entity_main/nested_execute_0
execute if score #logic owner_is_alive matches 0 run scoreboard players set @s kill_queue 1
scoreboard players reset #logic owner_is_alive
kill @s[scores={kill_queue=1}]
```

`@function mcgame:entity_main/nested_execute_2`

```mcfunction
scoreboard players set #logic owner_is_alive 1
function mcgame:mcgame_custom_2_main
```

`@function mcgame:entity_main/nested_execute_3`

```mcfunction
scoreboard players set #logic owner_is_alive 0
execute on origin at @s run function mcgame:entity_main/nested_execute_2
execute if score #logic owner_is_alive matches 0 run scoreboard players set @s kill_queue 1
scoreboard players reset #logic owner_is_alive
kill @s[scores={kill_queue=1}]
```

`@function mcgame:entity_main/nested_execute_4`

```mcfunction
scoreboard players set #logic owner_is_alive 1
function mcgame:mcgame_custom_3_main
```

`@function mcgame:entity_main/nested_execute_5`

```mcfunction
scoreboard players set #logic owner_is_alive 0
execute on origin at @s run function mcgame:entity_main/nested_execute_4
execute if score #logic owner_is_alive matches 0 run scoreboard players set @s kill_queue 1
scoreboard players reset #logic owner_is_alive
kill @s[scores={kill_queue=1}]
```

`@function mcgame:entity_main/nested_execute_6`

```mcfunction
scoreboard players set #logic owner_is_alive 1
function mcgame:mcgame_custom_4_main
```

`@function mcgame:entity_main/nested_execute_7`

```mcfunction
scoreboard players set #logic owner_is_alive 0
execute on origin at @s run function mcgame:entity_main/nested_execute_6
execute if score #logic owner_is_alive matches 0 run scoreboard players set @s kill_queue 1
scoreboard players reset #logic owner_is_alive
kill @s[scores={kill_queue=1}]
```

### demo

`@function(strip_final_newline) demo:load`

```mcfunction

```

`@function demo:summon`

```mcfunction
summon zombie ~ ~ ~ {Glowing: 1b, PersistenceRequired: 1b, Passengers: [{id: "minecraft:marker", UUID: [I; 0, 0, 0, 4]}, {id: "minecraft:snowball", NoGravity: 1b, Tags: ["mcgame_core_entity"]}]}
execute as 00000000-0000-0000-0000-000000000004 run function demo:summon/nested_execute_2
execute positioned ~ ~ ~2 run function demo:summon/nested_execute_6
execute positioned ~ ~ ~4 run function demo:summon/nested_execute_10
execute positioned ~ ~ ~6 run function demo:summon/nested_execute_14
```

`@function demo:summon/nested_execute_0`

```mcfunction
ride @s dismount
ride @s mount 00000000-0000-0000-0000-000000000000
```

`@function demo:summon/nested_execute_1`

```mcfunction
function mcgame:mcgame_custom_1_spawn
tag @s add mcgame_ticking
tag @s add mcgame_custom_1
data modify entity @e[type=minecraft:snowball, distance=..5, limit=1, sort=nearest] Owner set from entity @s UUID
execute as @e[type=minecraft:snowball, distance=..5, limit=1, sort=nearest] run function demo:summon/nested_execute_0
```

`@function demo:summon/nested_execute_2`

```mcfunction
execute on vehicle at @s run function demo:summon/nested_execute_1
kill @s
```

`@function demo:summon/nested_execute_3`

```mcfunction
ride @s dismount
ride @s mount 00000000-0000-0000-0000-000000000001
```

`@function demo:summon/nested_execute_4`

```mcfunction
function mcgame:mcgame_custom_2_spawn
tag @s add mcgame_ticking
tag @s add mcgame_custom_2
data modify entity @e[type=minecraft:snowball, distance=..5, limit=1, sort=nearest] Owner set from entity @s UUID
execute as @e[type=minecraft:snowball, distance=..5, limit=1, sort=nearest] run function demo:summon/nested_execute_3
```

`@function demo:summon/nested_execute_5`

```mcfunction
execute on vehicle at @s run function demo:summon/nested_execute_4
kill @s
```

`@function demo:summon/nested_execute_6`

```mcfunction
summon skeleton ~ ~ ~ {HandItems: [{id: "minecraft:stone_sword", Count: 1b, tag: {Enchantments: [{id: "minecraft:knockback", lvl: 5s}]}}, {}], ArmorItems: [{}, {}, {id: "minecraft:leather_chestplate", Count: 1b}, {id: "minecraft:leather_helmet", Count: 1b}], Passengers: [{id: "minecraft:marker", UUID: [I; 0, 0, 0, 5]}, {id: "minecraft:snowball", NoGravity: 1b, Tags: ["mcgame_core_entity"]}]}
execute as 00000000-0000-0000-0000-000000000005 run function demo:summon/nested_execute_5
```

`@function demo:summon/nested_execute_7`

```mcfunction
ride @s dismount
ride @s mount 00000000-0000-0000-0000-000000000002
```

`@function demo:summon/nested_execute_8`

```mcfunction
function mcgame:mcgame_custom_3_spawn
tag @s add mcgame_ticking
tag @s add mcgame_custom_3
data modify entity @e[type=minecraft:snowball, distance=..5, limit=1, sort=nearest] Owner set from entity @s UUID
execute as @e[type=minecraft:snowball, distance=..5, limit=1, sort=nearest] run function demo:summon/nested_execute_7
```

`@function demo:summon/nested_execute_9`

```mcfunction
execute on vehicle at @s run function demo:summon/nested_execute_8
kill @s
```

`@function demo:summon/nested_execute_10`

```mcfunction
summon zombie ~ ~ ~ {Passengers: [{id: "minecraft:marker", UUID: [I; 0, 0, 0, 6]}, {id: "minecraft:snowball", NoGravity: 1b, Tags: ["mcgame_core_entity"]}]}
execute as 00000000-0000-0000-0000-000000000006 run function demo:summon/nested_execute_9
```

`@function demo:summon/nested_execute_11`

```mcfunction
ride @s dismount
ride @s mount 00000000-0000-0000-0000-000000000003
```

`@function demo:summon/nested_execute_12`

```mcfunction
function mcgame:mcgame_custom_4_spawn
tag @s add mcgame_ticking
tag @s add mcgame_custom_4
data modify entity @e[type=minecraft:snowball, distance=..5, limit=1, sort=nearest] Owner set from entity @s UUID
execute as @e[type=minecraft:snowball, distance=..5, limit=1, sort=nearest] run function demo:summon/nested_execute_11
```

`@function demo:summon/nested_execute_13`

```mcfunction
execute on vehicle at @s run function demo:summon/nested_execute_12
kill @s
```

`@function demo:summon/nested_execute_14`

```mcfunction
summon spider ~ ~ ~ {ActiveEffects: [{Id: 14, Amplifier: 1b, Duration: 400, ShowParticles: 0b}], Passengers: [{id: "minecraft:marker", UUID: [I; 0, 0, 0, 7]}, {id: "minecraft:snowball", NoGravity: 1b, Tags: ["mcgame_core_entity"]}]}
execute as 00000000-0000-0000-0000-000000000007 run function demo:summon/nested_execute_13
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
