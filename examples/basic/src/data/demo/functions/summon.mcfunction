import mcgame:entity as entity
import mcgame:file as file

glow = file.MCData("glow.txt")
flame = file.MCScript("flame.mcfunction")
explosion = file.MCScript("explosion.mcfunction")
sound = file.MCScript("sound.mcfunction")
leather = file.MCData("leather.txt")
stone_sword = file.MCData("stone_sword.txt")
invisibility = file.MCData("invisibility.txt")

custom_1 = entity.MCEntity("custom_1", "zombie", data=glow, tick=flame, spawn=explosion)
custom_2 = entity.MCEntity("custom_2", "skeleton", data=[stone_sword, leather], spawn=sound)
custom_3 = entity.MCEntity("custom_3", "zombie", tick=[flame, explosion], spawn=explosion)
custom_4 = entity.MCEntity("custom_4", "spider", data=invisibility, spawn=sound)

custom_1.summon()
positioned ~ ~ ~2:
    custom_2.summon()
positioned ~ ~ ~4:
    custom_3.summon()
positioned ~ ~ ~6:
    custom_4.summon()