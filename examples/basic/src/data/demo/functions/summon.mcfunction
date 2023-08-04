import mcgame:entity as entity
import mcgame:file as file

glow = file.MCData("entity")
flame = file.MCScript("flame")

mob = entity.MCEntity("hola", "zombie", data=glow, tick=flame)

mob.summon()