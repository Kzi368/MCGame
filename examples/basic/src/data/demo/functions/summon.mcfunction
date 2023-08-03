import mcgame:entity as ent
import mcgame:file as file

glow = file.MCData("entity")
flame = file.MCScript("flame")

mob = ent.MCEntity("hola", "zombie", data=glow, tick=flame)

mob.summon()