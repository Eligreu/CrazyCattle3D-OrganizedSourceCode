extends Node
var global_dead = false
var global_sheep = 0

#signal sheepDie

var sheepnum = 0

var eliminated = ""

var playername = "Nardo Polo"

var currentlevel = ""

var unlockedlevels = [
	"ireland"
]
var unlockedlevelsog = unlockedlevels

var beatenlevels = []

var levels = [
	{namee="ireland", unlocks="egypt"},
	{namee="egypt", unlocks="sweden"},
	{namee="sweden", unlocks=null}
]
