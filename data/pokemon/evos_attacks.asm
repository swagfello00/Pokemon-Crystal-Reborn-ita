SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evolution_moves.asm"
INCLUDE "data/pokemon/evos_attacks_pointers.asm"

EvosAttacks::

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, TAKE_DOWN
	db 17, SLUDGE
	db 20, RAZOR_LEAF
	db 22, SWEET_SCENT
	db 25, GROWTH
	db 27, DOUBLE_EDGE
	db 33, SYNTHESIS
	db 35, SLUDGE_BOMB
	db 37, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 4, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, TAKE_DOWN
	db 19, SLUDGE
	db 22, RAZOR_LEAF
	db 25, SWEET_SCENT
	db 28, GROWTH
	db 31, DOUBLE_EDGE
	db 35, SYNTHESIS
	db 37, SLUDGE_BOMB
	db 39, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 4, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 15, TAKE_DOWN
	db 19, SLUDGE
	db 22, RAZOR_LEAF
	db 25, SWEET_SCENT
	db 28, GROWTH
	db 31, DOUBLE_EDGE
	db 41, SYNTHESIS
	db 45, SLUDGE_BOMB
	db 48, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 10, RAGE
	db 12, METAL_CLAW
	db 13, SMOKESCREEN
	db 19, SCARY_FACE
	db 25, DRAGON_RAGE
	db 28, SLASH
	db 31, FLAMETHROWER
	db 37, OUTRAGE
	db 41, FIRE_BLAST
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 10, RAGE
	db 12, METAL_CLAW
	db 13, SMOKESCREEN
	db 14, FIRE_SPIN
	db 21, SCARY_FACE
	db 28, DRAGON_RAGE
	db 32, SLASH
	db 34, FLAMETHROWER
	db 39, OUTRAGE
	db 43, FIRE_BLAST
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, EMBER
	db 1, SMOKESCREEN
	db 7, EMBER
	db 10, RAGE
	db 12, METAL_CLAW
	db 13, SMOKESCREEN
	db 14, FIRE_SPIN
	db 21, SCARY_FACE
	db 28, DRAGON_RAGE
	db 32, SLASH
	db 34, FLAMETHROWER
	db 35, WING_ATTACK
	db 41, OUTRAGE
	db 47, FIRE_BLAST
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 12, WATER_GUN
	db 15, BITE
	db 19, RAPID_SPIN
	db 22, PROTECT
	db 25, BUBBLEBEAM
	db 31, SKULL_BASH
	db 33, RAIN_DANCE
	db 37, CRUNCH
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, BUBBLE
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 12, WATER_GUN
	db 15, BITE
	db 21, RAPID_SPIN
	db 25, PROTECT
	db 27, BUBBLEBEAM
	db 33, SKULL_BASH
	db 37, RAIN_DANCE
	db 41, CRUNCH
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, BUBBLE
	db 1, WITHDRAW
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 12, WATER_GUN
	db 15, BITE
	db 21, RAPID_SPIN
	db 25, PROTECT
	db 27, BUBBLEBEAM
	db 33, SKULL_BASH
	db 42, RAIN_DANCE
	db 47, CRUNCH
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, CONFUSION
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 16, GUST
	db 18, SUPERSONIC
	db 23, WHIRLWIND
	db 29, PSYBEAM
	db 35, DREAM_EATER
	db 40, SAFEGUARD
	db 43, PSYCHIC_M
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, HARDEN
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TWINEEDLE
	db 1, FURY_ATTACK
	db 14, RAGE
	db 15, FOCUS_ENERGY
	db 17, PURSUIT
	db 20, TWINEEDLE
	db 29, AGILITY
	db 35, PIN_MISSILE
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 9, GUST
	db 15, QUICK_ATTACK
	db 21, WHIRLWIND
	db 23, RAZOR_WIND
	db 25, WING_ATTACK
	db 37, AGILITY
	db 47, MIRROR_MOVE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 1, GUST
	db 5, SAND_ATTACK
	db 9, GUST
	db 15, QUICK_ATTACK
	db 16, TWISTER
	db 23, WHIRLWIND
	db 25, RAZOR_WIND
	db 29, WING_ATTACK
	db 43, AGILITY
	db 55, MIRROR_MOVE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKY_ATTACK
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 1, GUST
	db 1, QUICK_ATTACK
	db 5, SAND_ATTACK
	db 9, GUST
	db 15, QUICK_ATTACK
	db 16, TWISTER
	db 23, WHIRLWIND
	db 25, RAZOR_WIND
	db 29, WING_ATTACK
	db 46, AGILITY
	db 61, MIRROR_MOVE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 13, HYPER_FANG
	db 16, FOCUS_ENERGY
	db 18, PURSUIT
	db 27, CRUNCH
	db 34, SUPER_FANG
	db 40, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWORDS_DANCE
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 13, HYPER_FANG
	db 16, FOCUS_ENERGY
	db 18, PURSUIT
	db 19, SCARY_FACE
	db 30, CRUNCH
	db 40, SUPER_FANG
	db 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 7, LEER
	db 13, FURY_ATTACK
	db 18, FOCUS_ENERGY
	db 22, WING_ATTACK
	db 25, PURSUIT
	db 31, MIRROR_MOVE
	db 37, DRILL_PECK
	db 43, AGILITY
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKY_ATTACK
	db 1, PECK
	db 1, GROWL
	db 1, LEER
	db 1, FURY_ATTACK
	db 7, LEER
	db 13, FURY_ATTACK
	db 18, FOCUS_ENERGY
	db 23, WING_ATTACK
	db 26, PURSUIT
	db 32, MIRROR_MOVE
	db 40, DRILL_PECK
	db 47, AGILITY
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 9, POISON_STING
	db 15, BITE
	db 20, ACID
	db 23, GLARE
	db 25, SLUDGE
	db 29, SCREECH
	db 33, CRUNCH
	db 37, HAZE
	db 44, SLUDGE_BOMB
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, WRAP
	db 1, LEER
	db 1, POISON_STING
	db 1, BITE
	db 9, POISON_STING
	db 15, BITE
	db 20, ACID
	db 25, GLARE
	db 29, SLUDGE
	db 33, SCREECH
	db 36, CRUNCH
	db 43, HAZE
	db 51, SLUDGE_BOMB
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, QUICK_ATTACK
	db 15, DOUBLE_TEAM
	db 18, DOUBLE_KICK
	db 20, SLAM
	db 26, THUNDERBOLT
	db 33, AGILITY
	db 37, LIGHT_SCREEN
	db 41, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, BIDE
	db 6, DEFENSE_CURL
	db 9, RAPID_SPIN
	db 11, SAND_ATTACK
	db 14, POISON_STING
	db 16, FURY_CUTTER
	db 18, FURY_SWIPES
	db 20, ROLLOUT
	db 23, SWIFT
	db 26, METAL_CLAW
	db 28, DIG
	db 30, SLASH
	db 34, MAGNITUDE
	db 37, SANDSTORM
	db 40, PROTECT
	db 42, SWORDS_DANCE
	db 45, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, BIDE
	db 1, DEFENSE_CURL
	db 1, SAND_ATTACK
	db 6, DEFENSE_CURL
	db 9, RAPID_SPIN
	db 11, SAND_ATTACK
	db 14, POISON_STING
	db 16, FURY_CUTTER
	db 18, FURY_SWIPES
	db 20, ROLLOUT
	db 24, SWIFT
	db 28, METAL_CLAW
	db 30, DIG
	db 33, SLASH
	db 38, MAGNITUDE
	db 40, SANDSTORM
	db 43, PROTECT
	db 45, SWORDS_DANCE
	db 52, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 7, TAIL_WHIP
	db 8, SCRATCH
	db 9, POISON_STING
	db 12, DOUBLE_KICK
	db 15, FURY_SWIPES
	db 21, BITE
	db 25, SLUDGE
	db 30, CRUNCH
	db 38, SLUDGE_BOMB
	db 45, SUPER_FANG
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TACKLE
	db 7, TAIL_WHIP
	db 8, SCRATCH
	db 9, POISON_STING
	db 12, DOUBLE_KICK
	db 15, FURY_SWIPES
	db 27, BITE
	db 30, SLUDGE
	db 36, CRUNCH
	db 46, SLUDGE_BOMB
	db 58, SUPER_FANG
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, CROSS_CHOP
	db 1, TACKLE
	db 1, SCRATCH
	db 1, DOUBLE_KICK
	db 1, TAIL_WHIP
	db 23, BODY_SLAM
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 7, PECK
	db 8, HORN_ATTACK
	db 9, POISON_STING
	db 12, DOUBLE_KICK
	db 15, FURY_ATTACK
	db 19, BITE
	db 23, FOCUS_ENERGY
	db 25, SLUDGE
	db 30, CRUNCH
	db 33, DRILL_PECK
	db 38, SLUDGE_BOMB
	db 45, HORN_DRILL
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 7, PECK
	db 8, HORN_ATTACK
	db 9, POISON_STING
	db 12, DOUBLE_KICK
	db 15, FURY_ATTACK
	db 25, BITE
	db 27, FOCUS_ENERGY
	db 30, SLUDGE
	db 36, CRUNCH
	db 38, DRILL_PECK
	db 46, SLUDGE_BOMB
	db 58, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGAHORN
	db 1, TACKLE
	db 1, HORN_ATTACK
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 23, THRASH
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 4, ENCORE
	db 8, SING
	db 13, DOUBLESLAP
	db 16, DEFENSE_CURL
	db 19, MINIMIZE
	db 25, BODY_SLAM
	db 28, AMNESIA
	db 34, METRONOME
	db 37, LIGHT_SCREEN
	db 43, MOONLIGHT
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_EDGE
	db 1, SING
	db 1, DOUBLESLAP
	db 1, METRONOME
	db 1, MOONLIGHT
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, EMBER
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 13, ROAR
	db 16, FIRE_SPIN
	db 19, CONFUSE_RAY
	db 23, FAINT_ATTACK
	db 25, SAFEGUARD
	db 28, PSYBEAM
	db 31, FLAMETHROWER
	db 36, PSYCHIC_M
	db 43, FIRE_BLAST
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, EMBER
	db 1, QUICK_ATTACK
	db 1, CONFUSE_RAY
	db 1, SAFEGUARD
	db 43, FIRE_BLAST
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, POUND
	db 4, DEFENSE_CURL
	db 9, DISABLE
	db 13, BIDE
	db 14, DOUBLESLAP
	db 19, ROLLOUT
	db 25, BODY_SLAM
	db 29, REST
	db 34, DOUBLE_EDGE
	db 39, MIMIC
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_EDGE
	db 1, SING
	db 1, DISABLE
	db 1, DEFENSE_CURL
	db 1, DOUBLESLAP
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 1, GUST
	db 6, SUPERSONIC
	db 8, ABSORB
	db 10, ACID
	db 12, BITE
	db 17, WING_ATTACK
	db 19, CONFUSE_RAY
	db 21, SWIFT
	db 23, MEGA_DRAIN
	db 25, SLUDGE
	db 29, CRUNCH
	db 31, MEAN_LOOK
	db 36, GIGA_DRAIN
	db 41, SLUDGE_BOMB
	db 46, HAZE
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, LEECH_LIFE
	db 1, SUPERSONIC
	db 1, GUST
	db 6, SUPERSONIC
	db 8, ABSORB
	db 10, ACID
	db 12, BITE
	db 17, WING_ATTACK
	db 19, CONFUSE_RAY
	db 21, SWIFT
	db 25, MEGA_DRAIN
	db 27, SLUDGE
	db 32, CRUNCH
	db 35, MEAN_LOOK
	db 40, GIGA_DRAIN
	db 45, SLUDGE_BOMB
	db 55, HAZE
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 7, SWEET_SCENT
	db 9, ACID
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 23, SLUDGE
	db 27, GIGA_DRAIN
	db 32, MOONLIGHT
	db 35, SLUDGE_BOMB
	db 39, PETAL_DANCE
	db 44, SOLARBEAM
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 1, SWEET_SCENT
	db 1, POISONPOWDER
	db 7, SWEET_SCENT
	db 9, ACID
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 24, SLUDGE
	db 29, GIGA_DRAIN
	db 35, MOONLIGHT
	db 39, SLUDGE_BOMB
	db 44, PETAL_DANCE
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, GIGA_DRAIN
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, PETAL_DANCE
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 7, STUN_SPORE
	db 11, ABSORB
	db 13, POISONPOWDER
	db 15, FURY_SWIPES
	db 17, FURY_CUTTER
	db 19, LEECH_LIFE
	db 25, SPORE
	db 27, MEGA_DRAIN
	db 31, SLASH
	db 37, GROWTH
	db 43, GIGA_DRAIN
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 7, STUN_SPORE
	db 11, ABSORB
	db 13, POISONPOWDER
	db 15, FURY_SWIPES
	db 17, FURY_CUTTER
	db 19, LEECH_LIFE
	db 28, SPORE
	db 31, MEGA_DRAIN
	db 37, SLASH
	db 46, GROWTH
	db 55, GIGA_DRAIN
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 7, LEECH_LIFE
	db 9, SUPERSONIC
	db 11, CONFUSION
	db 13, ACID
	db 20, POISONPOWDER
	db 25, SLUDGE
	db 28, STUN_SPORE
	db 33, PSYBEAM
	db 36, SLEEP_POWDER
	db 41, PSYCHIC_M
	db 47, SLUDGE_BOMB
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, AGILITY
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 1, SUPERSONIC
	db 7, LEECH_LIFE
	db 9, SUPERSONIC
	db 11, CONFUSION
	db 13, ACID
	db 20, POISONPOWDER
	db 25, SLUDGE
	db 28, STUN_SPORE
	db 29, GUST
	db 36, PSYBEAM
	db 42, SLEEP_POWDER
	db 47, PSYCHIC_M
	db 52, SLUDGE_BOMB
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 5, GROWL
	db 7, MUD_SLAP
	db 9, MAGNITUDE
	db 15, FURY_SWIPES
	db 17, DIG
	db 25, AGILITY
	db 33, SLASH
	db 41, EARTHQUAKE
	db 49, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 1, GROWL
	db 1, MAGNITUDE
	db 5, GROWL
	db 7, MUD_SLAP
	db 9, MAGNITUDE
	db 15, FURY_SWIPES
	db 17, DIG
	db 25, AGILITY
	db 25, TRI_ATTACK
	db 37, SLASH
	db 49, EARTHQUAKE
	db 61, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 11, BITE
	db 14, FURY_SWIPES
	db 17, SCREECH
	db 20, PAY_DAY
	db 28, FAINT_ATTACK
	db 38, CRUNCH
	db 46, SLASH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, AMNESIA
	db 1, HYPNOSIS
	db 1, SCRATCH
	db 1, GROWL
	db 11, BITE
	db 14, FURY_SWIPES
	db 17, SCREECH
	db 20, PAY_DAY
	db 21, SWIFT
	db 29, FAINT_ATTACK
	db 46, CRUNCH
	db 53, SLASH
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, TAIL_WHIP
	db 7, WATER_GUN
	db 10, DISABLE
	db 13, FURY_SWIPES
	db 16, CONFUSION
	db 23, SCREECH
	db 25, BUBBLEBEAM
	db 27, PSYBEAM
	db 31, PSYCH_UP
	db 40, AMNESIA
	db 45, PSYCHIC_M
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, ENCORE
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 1, DISABLE
	db 1, CONFUSION
	db 5, TAIL_WHIP
	db 7, WATER_GUN
	db 10, DISABLE
	db 13, FURY_SWIPES
	db 16, CONFUSION
	db 23, SCREECH
	db 25, BUBBLEBEAM
	db 27, PSYBEAM
	db 31, PSYCH_UP
	db 44, AMNESIA
	db 53, PSYCHIC_M
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, FURY_SWIPES
	db 9, LOW_KICK
	db 12, PURSUIT
	db 15, KARATE_CHOP
	db 19, SWAGGER
	db 27, FOCUS_ENERGY
	db 30, SUBMISSION
	db 33, SEISMIC_TOSS
	db 39, CROSS_CHOP
	db 45, SCREECH
	db 47, OUTRAGE
	db 51, THRASH
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKULL_BASH
	db 1, SCRATCH
	db 1, LEER
	db 1, LOW_KICK
	db 1, RAGE
	db 6, FURY_SWIPES
	db 9, LOW_KICK
	db 12, PURSUIT
	db 15, KARATE_CHOP
	db 19, SWAGGER
	db 27, FOCUS_ENERGY
	db 27, RAGE
	db 33, SUBMISSION
	db 36, SEISMIC_TOSS
	db 45, CROSS_CHOP
	db 54, SCREECH
	db 57, OUTRAGE
	db 63, THRASH
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, BITE
	db 1, ROAR
	db 8, LEER
	db 9, EMBER
	db 17, TAKE_DOWN
	db 19, REVERSAL
	db 23, FLAME_WHEEL
	db 30, CRUNCH
	db 34, FLAMETHROWER
	db 39, DOUBLE_EDGE
	db 42, AGILITY
	db 45, OUTRAGE
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_EDGE
	db 1, ROAR
	db 1, LEER
	db 1, TAKE_DOWN
	db 1, FLAME_WHEEL
	db 34, EXTREMESPEED
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, POUND
	db 7, HYPNOSIS
	db 13, WATER_GUN
	db 19, DOUBLESLAP
	db 21, BUBBLEBEAM
	db 25, RAIN_DANCE
	db 31, BODY_SLAM
	db 37, BELLY_DRUM
	db 43, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, POUND
	db 1, HYPNOSIS
	db 1, WATER_GUN
	db 7, HYPNOSIS
	db 13, WATER_GUN
	db 19, DOUBLESLAP
	db 21, BUBBLEBEAM
	db 22, LOW_KICK
	db 27, RAIN_DANCE
	db 35, BODY_SLAM
	db 43, BELLY_DRUM
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, MIND_READER
	db 1, DYNAMICPUNCH
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, SUBMISSION
	db 35, CROSS_CHOP
	db 43, MIND_READER
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_TRADE, -1, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, KINESIS
	db 1, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 23, NIGHT_SHADE
	db 26, RECOVER
	db 31, FUTURE_SIGHT
	db 33, SUBSTITUTE
	db 38, PSYCHIC_M
	db 45, REFLECT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, ENCORE
	db 1, BARRIER
	db 1, TELEPORT
	db 1, KINESIS
	db 1, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 23, NIGHT_SHADE
	db 26, RECOVER
	db 31, FUTURE_SIGHT
	db 33, SUBSTITUTE
	db 38, PSYCHIC_M
	db 45, REFLECT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 7, FOCUS_ENERGY
	db 8, BIDE
	db 9, FORESIGHT
	db 13, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 25, VITAL_THROW
	db 31, SUBMISSION
	db 37, CROSS_CHOP
	db 43, SCARY_FACE
	db 51, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, -1, MACHAMP
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 8, BIDE
	db 9, FORESIGHT
	db 15, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 25, VITAL_THROW
	db 34, SUBMISSION
	db 43, CROSS_CHOP
	db 47, SCARY_FACE
	db 61, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, ENCORE
	db 1, COUNTER
	db 1, LOW_KICK
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 8, BIDE
	db 9, FORESIGHT
	db 15, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 25, VITAL_THROW
	db 34, SUBMISSION
	db 43, CROSS_CHOP
	db 47, SCARY_FACE
	db 61, DYNAMICPUNCH
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 23, ACID
	db 27, RAZOR_LEAF
	db 30, SWEET_SCENT
	db 37, SLUDGE
	db 45, SLAM
	db 50, SLUDGE_BOMB
	db 58, SOLARBEAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, GROWTH
	db 1, WRAP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 24, ACID
	db 29, RAZOR_LEAF
	db 33, SWEET_SCENT
	db 42, SLUDGE
	db 54, SLAM
	db 58, SLUDGE_BOMB
	db 64, SOLARBEAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWORDS_DANCE
	db 1, VINE_WHIP
	db 1, SLEEP_POWDER
	db 1, SWEET_SCENT
	db 1, RAZOR_LEAF
	db 64, SOLARBEAM
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, BUBBLE
	db 6, SUPERSONIC
	db 12, CONSTRICT
	db 13, WATER_GUN
	db 16, WRAP
	db 19, ACID
	db 25, BUBBLEBEAM
	db 28, SLUDGE
	db 36, BARRIER
	db 43, SCREECH
	db 46, SLUDGE_BOMB
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, MIRROR_COAT
	db 1, HAZE
	db 1, POISON_STING
	db 1, BUBBLE
	db 1, SUPERSONIC
	db 1, CONSTRICT
	db 6, SUPERSONIC
	db 12, CONSTRICT
	db 13, WATER_GUN
	db 16, WRAP
	db 19, ACID
	db 25, BUBBLEBEAM
	db 28, SLUDGE
	db 38, BARRIER
	db 47, SCREECH
	db 52, SLUDGE_BOMB
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 9, BIDE
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 19, TAKE_DOWN
	db 21, SELFDESTRUCT
	db 26, HARDEN
	db 31, ROLLOUT
	db 34, DOUBLE_EDGE
	db 36, EARTHQUAKE
	db 38, ROCK_SLIDE
	db 41, EXPLOSION
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_TRADE, -1, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, ROCK_THROW
	db 6, DEFENSE_CURL
	db 9, BIDE
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 19, TAKE_DOWN
	db 21, SELFDESTRUCT
	db 27, HARDEN
	db 34, ROLLOUT
	db 38, DOUBLE_EDGE
	db 41, EARTHQUAKE
	db 44, ROCK_SLIDE
	db 48, EXPLOSION
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_PUNCH
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, ROCK_THROW
	db 1, MAGNITUDE
	db 6, DEFENSE_CURL
	db 9, BIDE
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 19, TAKE_DOWN
	db 21, SELFDESTRUCT
	db 27, HARDEN
	db 34, ROLLOUT
	db 38, DOUBLE_EDGE
	db 41, EARTHQUAKE
	db 44, ROCK_SLIDE
	db 48, EXPLOSION
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 13, EMBER
	db 15, DOUBLE_KICK
	db 19, STOMP
	db 26, FIRE_SPIN
	db 29, FLAME_WHEEL
	db 34, TAKE_DOWN
	db 43, AGILITY
	db 47, DOUBLE_EDGE
	db 53, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGAHORN
	db 1, TACKLE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 1, EMBER
	db 4, GROWL
	db 8, TAIL_WHIP
	db 10, QUICK_ATTACK
	db 13, EMBER
	db 15, DOUBLE_KICK
	db 19, STOMP
	db 26, FIRE_SPIN
	db 29, FLAME_WHEEL
	db 34, TAKE_DOWN
	db 39, FURY_ATTACK
	db 47, AGILITY
	db 53, DOUBLE_EDGE
	db 61, FIRE_BLAST
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_TRADE, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 10, WATER_GUN
	db 15, CONFUSION
	db 20, HEADBUTT
	db 28, BUBBLEBEAM
	db 29, DISABLE
	db 32, RAIN_DANCE
	db 36, REST
	db 38, PSYBEAM
	db 40, PSYCH_UP
	db 41, AMNESIA
	db 45, PSYCHIC_M
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, STOMP
	db 1, CURSE
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 6, GROWL
	db 10, WATER_GUN
	db 15, CONFUSION
	db 20, HEADBUTT
	db 28, BUBBLEBEAM
	db 29, DISABLE
	db 32, RAIN_DANCE
	db 36, REST
	db 36, WITHDRAW
	db 41, PSYBEAM
	db 44, PSYCH_UP
	db 46, AMNESIA
	db 54, PSYCHIC_M
	db 62, HYDRO_PUMP
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 23, SWIFT
	db 25, SPARK
	db 27, LOCK_ON
	db 31, LIGHT_SCREEN
	db 39, SCREECH
	db 45, ZAP_CANNON
	db 53, THUNDER
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERBOLT
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 1, SUPERSONIC
	db 1, SONICBOOM
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 23, SWIFT
	db 25, SPARK
	db 27, LOCK_ON
	db 28, TRI_ATTACK
	db 33, LIGHT_SCREEN
	db 43, SCREECH
	db 53, ZAP_CANNON
	db 63, THUNDER
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 7, SAND_ATTACK
	db 9, FURY_CUTTER
	db 13, LEER
	db 19, FURY_ATTACK
	db 22, FOCUS_ENERGY
	db 25, SWORDS_DANCE
	db 27, RAZOR_LEAF
	db 31, AGILITY
	db 33, DRILL_PECK
	db 37, SLASH
	db 40, MIRROR_MOVE
	db 44, FALSE_SWIPE
	db 55, SKY_ATTACK
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 9, PURSUIT
	db 13, FURY_ATTACK
	db 21, TRI_ATTACK
	db 25, RAGE
	db 33, DRILL_PECK
	db 35, SWORDS_DANCE
	db 37, AGILITY
	db 40, JUMP_KICK
	db 43, THRASH
	db 47, HI_JUMP_KICK
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, PURSUIT
	db 1, FURY_ATTACK
	db 9, PURSUIT
	db 13, FURY_ATTACK
	db 21, TRI_ATTACK
	db 25, RAGE
	db 30, MIRROR_MOVE
	db 38, DRILL_PECK
	db 43, SWORDS_DANCE
	db 47, AGILITY
	db 49, JUMP_KICK
	db 52, THRASH
	db 59, HI_JUMP_KICK
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 5, GROWL
	db 11, ICY_WIND
	db 13, ENCORE
	db 16, AURORA_BEAM
	db 21, REST
	db 32, TAKE_DOWN
	db 37, ICE_BEAM
	db 40, BODY_SLAM
	db 44, DOUBLE_EDGE
	db 48, SAFEGUARD
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, GROWL
	db 1, AURORA_BEAM
	db 5, GROWL
	db 11, ICY_WIND
	db 13, ENCORE
	db 16, AURORA_BEAM
	db 21, REST
	db 32, TAKE_DOWN
	db 43, ICE_BEAM
	db 45, BODY_SLAM
	db 55, DOUBLE_EDGE
	db 60, SAFEGUARD
	db 70, HYDRO_PUMP
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, POUND
	db 5, HARDEN
	db 7, MUD_SLAP
	db 10, DISABLE
	db 16, SLUDGE
	db 23, MINIMIZE
	db 26, BODY_SLAM
	db 31, SCREECH
	db 40, ACID_ARMOR
	db 50, SLUDGE_BOMB
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, POISON_GAS
	db 1, POUND
	db 1, HARDEN
	db 1, MUD_SLAP
	db 5, HARDEN
	db 7, MUD_SLAP
	db 10, DISABLE
	db 16, SLUDGE
	db 23, MINIMIZE
	db 26, BODY_SLAM
	db 31, SCREECH
	db 34, HAZE
	db 45, ACID_ARMOR
	db 60, SLUDGE_BOMB
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 6, WATER_GUN
	db 9, SUPERSONIC
	db 13, LEER
	db 17, AURORA_BEAM
	db 25, PROTECT
	db 33, CLAMP
	db 41, ICE_BEAM
	db 61, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, TWINEEDLE
	db 1, WITHDRAW
	db 1, SUPERSONIC
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 33, SPIKES
	db 41, SPIKE_CANNON
	db 61, HYDRO_PUMP
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SMOG
	db 8, SPITE
	db 10, POISON_GAS
	db 13, MEAN_LOOK
	db 16, CURSE
	db 19, ACID
	db 21, NIGHT_SHADE
	db 26, DISABLE
	db 28, CONFUSE_RAY
	db 29, SLUDGE
	db 30, SHADOW_BALL
	db 33, DREAM_EATER
	db 36, DESTINY_BOND
	db 40, NIGHTMARE
	db 47, SLUDGE_BOMB
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_TRADE, -1, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SPITE
	db 1, SMOG
	db 8, SPITE
	db 10, POISON_GAS
	db 13, MEAN_LOOK
	db 16, CURSE
	db 19, ACID
	db 21, NIGHT_SHADE
	db 28, DISABLE
	db 31, CONFUSE_RAY
	db 32, SLUDGE
	db 33, SHADOW_BALL
	db 39, DREAM_EATER
	db 48, DESTINY_BOND
	db 55, NIGHTMARE
	db 61, SLUDGE_BOMB
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, HAZE
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SPITE
	db 1, SMOG
	db 8, SPITE
	db 10, POISON_GAS
	db 13, MEAN_LOOK
	db 16, CURSE
	db 19, ACID
	db 21, NIGHT_SHADE
	db 28, DISABLE
	db 31, CONFUSE_RAY
	db 32, SLUDGE
	db 33, SHADOW_BALL
	db 39, DREAM_EATER
	db 48, DESTINY_BOND
	db 55, NIGHTMARE
	db 61, SLUDGE_BOMB
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 1, HARDEN
	db 7, CURSE
	db 10, BIND
	db 14, ROCK_THROW
	db 20, RAGE
	db 23, DRAGONBREATH
	db 25, SLAM
	db 27, DIG
	db 31, ROCK_SLIDE
	db 35, SANDSTORM
	db 38, BODY_SLAM
	db 43, EARTHQUAKE
	db 46, DOUBLE_EDGE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 10, DISABLE
	db 18, CONFUSION
	db 25, HEADBUTT
	db 29, PSYBEAM
	db 31, POISON_GAS
	db 33, SWAGGER
	db 36, MEDITATE
	db 38, DREAM_EATER
	db 40, PSYCHIC_M
	db 43, PSYCH_UP
	db 45, FUTURE_SIGHT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, POUND
	db 1, HYPNOSIS
	db 1, DISABLE
	db 1, CONFUSION
	db 10, DISABLE
	db 18, CONFUSION
	db 25, HEADBUTT
	db 25, NIGHTMARE
	db 31, PSYBEAM
	db 33, POISON_GAS
	db 37, SWAGGER
	db 40, MEDITATE
	db 45, DREAM_EATER
	db 49, PSYCHIC_M
	db 55, PSYCH_UP
	db 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, LEER
	db 12, VICEGRIP
	db 16, HARDEN
	db 19, BUBBLEBEAM
	db 21, METAL_CLAW
	db 23, STOMP
	db 27, GUILLOTINE
	db 30, SLAM
	db 34, PROTECT
	db 37, BODY_SLAM
	db 41, CRABHAMMER
	db 45, FLAIL
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, AGILITY
	db 1, BUBBLE
	db 1, LEER
	db 1, VICEGRIP
	db 5, LEER
	db 12, VICEGRIP
	db 16, HARDEN
	db 19, BUBBLEBEAM
	db 21, METAL_CLAW
	db 23, STOMP
	db 27, GUILLOTINE
	db 27, AMNESIA
	db 35, SLAM
	db 38, PROTECT
	db 44, BODY_SLAM
	db 49, CRABHAMMER
	db 56, FLAIL
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 9, SCREECH
	db 11, THUNDERSHOCK
	db 17, SONICBOOM
	db 20, SPARK
	db 23, SELFDESTRUCT
	db 29, ROLLOUT
	db 31, THUNDERBOLT
	db 33, LIGHT_SCREEN
	db 37, SWIFT
	db 39, EXPLOSION
	db 41, MIRROR_COAT
	db 46, THUNDER
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 1, SONICBOOM
	db 1, SELFDESTRUCT
	db 9, SCREECH
	db 11, THUNDERSHOCK
	db 17, SONICBOOM
	db 20, SPARK
	db 23, SELFDESTRUCT
	db 29, ROLLOUT
	db 33, THUNDERBOLT
	db 34, LIGHT_SCREEN
	db 40, SWIFT
	db 44, EXPLOSION
	db 48, MIRROR_COAT
	db 56, THUNDER
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, HYPNOSIS
	db 7, REFLECT
	db 13, LEECH_SEED
	db 19, CONFUSION
	db 25, STUN_SPORE
	db 31, POISONPOWDER
	db 37, SLEEP_POWDER
	db 38, PSYBEAM
	db 43, SOLARBEAM
	db 47, PSYCHIC_M
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, OUTRAGE
	db 1, AGILITY
	db 1, BARRAGE
	db 1, HYPNOSIS
	db 1, CONFUSION
	db 19, STOMP
	db 31, EGG_BOMB
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, BONE_CLUB
	db 13, HEADBUTT
	db 17, LEER
	db 21, FOCUS_ENERGY
	db 25, BONEMERANG
	db 29, RAGE
	db 33, FALSE_SWIPE
	db 37, THRASH
	db 41, BONE_RUSH
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWORDS_DANCE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 1, BONE_CLUB
	db 1, HEADBUTT
	db 5, TAIL_WHIP
	db 9, BONE_CLUB
	db 13, HEADBUTT
	db 17, LEER
	db 21, FOCUS_ENERGY
	db 25, BONEMERANG
	db 32, RAGE
	db 39, FALSE_SWIPE
	db 46, THRASH
	db 53, BONE_RUSH
	db 59, DOUBLE_EDGE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 6, MEDITATE
	db 11, ROLLING_KICK
	db 13, LOW_KICK
	db 16, JUMP_KICK
	db 21, FOCUS_ENERGY
	db 26, HI_JUMP_KICK
	db 31, MIND_READER
	db 36, FORESIGHT
	db 41, ENDURE
	db 46, MEGA_KICK
	db 51, REVERSAL
	db 57, CROSS_CHOP
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 7, AGILITY
	db 13, PURSUIT
	db 25, DIZZY_PUNCH
	db 26, THUNDERPUNCH
	db 26, ICE_PUNCH
	db 26, FIRE_PUNCH
	db 32, MACH_PUNCH
	db 38, MEGA_PUNCH
	db 44, DETECT
	db 50, COUNTER
	db 56, CROSS_CHOP
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 7, SUPERSONIC
	db 13, DEFENSE_CURL
	db 19, STOMP
	db 25, WRAP
	db 31, DISABLE
	db 33, ROLLOUT
	db 37, SLAM
	db 40, THRASH
	db 43, SCREECH
	db 47, BODY_SLAM
	db 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 9, SMOG
	db 17, SELFDESTRUCT
	db 21, SLUDGE
	db 25, SMOKESCREEN
	db 33, HAZE
	db 36, TOXIC
	db 41, EXPLOSION
	db 45, DESTINY_BOND
	db 47, SLUDGE_BOMB
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCHIC_M
	db 1, POISON_GAS
	db 1, TACKLE
	db 1, SMOG
	db 1, SELFDESTRUCT
	db 9, SMOG
	db 17, SELFDESTRUCT
	db 21, SLUDGE
	db 25, SMOKESCREEN
	db 33, HAZE
	db 40, TOXIC
	db 44, EXPLOSION
	db 51, DESTINY_BOND
	db 57, SLUDGE_BOMB
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 13, STOMP
	db 19, FURY_ATTACK
	db 21, ROCK_THROW
	db 24, MAGNITUDE
	db 31, SCARY_FACE
	db 37, HORN_DRILL
	db 41, ROCK_SLIDE
	db 45, MEGAHORN
	db 49, TAKE_DOWN
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 1, STOMP
	db 1, FURY_ATTACK
	db 13, STOMP
	db 19, FURY_ATTACK
	db 21, ROCK_THROW
	db 24, MAGNITUDE
	db 31, SCARY_FACE
	db 37, HORN_DRILL
	db 41, ROCK_SLIDE
	db 41, CRUNCH
	db 49, MEGAHORN
	db 54, TAKE_DOWN
	db 65, EARTHQUAKE
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, TAIL_WHIP
	db 10, SOFTBOILED
	db 13, DOUBLESLAP
	db 18, MINIMIZE
	db 20, TAKE_DOWN
	db 23, SING
	db 28, EGG_BOMB
	db 33, DEFENSE_CURL
	db 35, HEAL_BELL
	db 40, LIGHT_SCREEN
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 4, SLEEP_POWDER
	db 10, ABSORB
	db 13, POISONPOWDER
	db 15, CONFUSION
	db 19, VINE_WHIP
	db 23, GROWTH
	db 25, BIND
	db 29, LEECH_SEED
	db 31, MEGA_DRAIN
	db 34, STUN_SPORE
	db 38, ANCIENTPOWER
	db 40, SLAM
	db 44, AMNESIA
	db 46, GIGA_DRAIN
	db 48, BODY_SLAM
	db 54, SOLARBEAM
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 7, LEER
	db 13, BITE
	db 19, TAIL_WHIP
	db 25, MEGA_PUNCH
	db 31, RAGE
	db 34, CRUNCH
	db 37, ENDURE
	db 40, BODY_SLAM
	db 43, DIZZY_PUNCH
	db 46, OUTRAGE
	db 49, REVERSAL
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 8, SMOKESCREEN
	db 11, WATER_GUN
	db 15, LEER
	db 17, TWISTER
	db 22, BUBBLEBEAM
	db 26, FOCUS_ENERGY
	db 29, DRAGONBREATH
	db 36, AGILITY
	db 43, HYDRO_PUMP
	db 46, OUTRAGE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, ICE_BEAM
	db 1, DISABLE
	db 1, BUBBLE
	db 1, SMOKESCREEN
	db 1, LEER
	db 1, WATER_GUN
	db 8, SMOKESCREEN
	db 11, WATER_GUN
	db 15, LEER
	db 17, TWISTER
	db 22, BUBBLEBEAM
	db 26, FOCUS_ENERGY
	db 29, DRAGONBREATH
	db 31, AURORA_BEAM
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 60, OUTRAGE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 10, SUPERSONIC
	db 12, QUICK_ATTACK
	db 15, HORN_ATTACK
	db 17, WATER_GUN
	db 24, FLAIL
	db 29, FURY_ATTACK
	db 32, AGILITY
	db 38, WATERFALL
	db 40, DRILL_PECK
	db 43, HORN_DRILL
	db 45, MEGAHORN
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKULL_BASH
	db 1, PECK
	db 1, TAIL_WHIP
	db 10, SUPERSONIC
	db 12, QUICK_ATTACK
	db 15, HORN_ATTACK
	db 17, WATER_GUN
	db 24, FLAIL
	db 29, FURY_ATTACK
	db 32, AGILITY
	db 32, PSYBEAM
	db 41, WATERFALL
	db 46, DRILL_PECK
	db 49, HORN_DRILL
	db 54, MEGAHORN
	db 61, HYDRO_PUMP
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 7, WATER_GUN
	db 13, RAPID_SPIN
	db 19, RECOVER
	db 22, PSYWAVE
	db 23, SUPERSONIC
	db 25, SWIFT
	db 28, PSYBEAM
	db 31, BUBBLEBEAM
	db 32, AURORA_BEAM
	db 35, MINIMIZE
	db 37, CONFUSE_RAY
	db 38, BARRIER
	db 43, LIGHT_SCREEN
	db 45, ICE_BEAM
	db 47, PSYCHIC_M
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, RAPID_SPIN
	db 1, RECOVER
	db 1, BUBBLEBEAM
	db 37, CONFUSE_RAY
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, POUND
	db 6, CONFUSION
	db 11, SUBSTITUTE
	db 16, MEDITATE
	db 18, MIMIC
	db 21, DOUBLESLAP
	db 26, LIGHT_SCREEN
	db 26, REFLECT
	db 29, PSYWAVE
	db 31, ENCORE
	db 36, PSYBEAM
	db 39, DOUBLE_EDGE
	db 41, BATON_PASS
	db 43, PSYCHIC_M
	db 46, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 20, FURY_CUTTER
	db 24, AGILITY
	db 30, WING_ATTACK
	db 33, RAZOR_WIND
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 1, LOVELY_KISS
	db 1, POWDER_SNOW
	db 9, LOVELY_KISS
	db 13, POWDER_SNOW
	db 15, CONFUSION
	db 18, SCREECH
	db 21, DOUBLESLAP
	db 25, ICE_PUNCH
	db 33, PSYBEAM
	db 35, MEAN_LOOK
	db 41, BODY_SLAM
	db 45, PSYCHIC_M
	db 47, ICE_BEAM
	db 51, PERISH_SONG
	db 57, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 9, THUNDERPUNCH
	db 12, LOW_KICK
	db 17, LIGHT_SCREEN
	db 19, THUNDER_WAVE
	db 25, SWIFT
	db 36, SCREECH
	db 42, THUNDERBOLT
	db 47, CROSS_CHOP
	db 58, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 1, SMOG
	db 1, FIRE_PUNCH
	db 7, LEER
	db 13, SMOG
	db 15, FAINT_ATTACK
	db 17, LOW_KICK
	db 19, FIRE_PUNCH
	db 22, CONFUSE_RAY
	db 25, SMOKESCREEN
	db 29, FIRE_SPIN
	db 33, SUNNY_DAY
	db 41, FLAMETHROWER
	db 47, CROSS_CHOP
	db 57, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, VICEGRIP
	db 7, FOCUS_ENERGY
	db 13, BIND
	db 19, SEISMIC_TOSS
	db 25, HARDEN
	db 29, VITAL_THROW
	db 31, GUILLOTINE
	db 37, SUBMISSION
	db 40, THRASH
	db 43, SWORDS_DANCE
	db 47, CROSS_CHOP
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, RAGE
	db 13, HORN_ATTACK
	db 19, SCARY_FACE
	db 26, PURSUIT
	db 29, FOCUS_ENERGY
	db 34, REST
	db 38, TAKE_DOWN
	db 41, SWAGGER
	db 43, THRASH
	db 46, OUTRAGE
	db 53, DOUBLE_EDGE
	db 63, HYPER_BEAM
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, SPLASH
	db 15, TACKLE
	db 30, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THRASH
	db 1, BITE
	db 21, TWISTER
	db 25, DRAGON_RAGE
	db 30, LEER
	db 33, SCARY_FACE
	db 35, DRAGONBREATH
	db 38, CRUNCH
	db 40, HYDRO_PUMP
	db 42, OUTRAGE
	db 45, RAIN_DANCE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GROWL
	db 1, SING
	db 8, MIST
	db 15, BODY_SLAM
	db 22, CONFUSE_RAY
	db 25, DRAGONBREATH
	db 27, AURORA_BEAM
	db 29, PERISH_SONG
	db 36, ICE_BEAM
	db 43, RAIN_DANCE
	db 50, SAFEGUARD
	db 57, HYDRO_PUMP
	db 65, BLIZZARD
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, GROWL
	db 20, DOUBLE_KICK
	db 23, QUICK_ATTACK
	db 25, SWIFT
	db 27, CHARM
	db 30, BITE
	db 33, TAKE_DOWN
	db 36, FOCUS_ENERGY
	db 36, BATON_PASS
	db 41, CRUNCH
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 8, SAND_ATTACK
	db 16, GROWL
	db 20, DOUBLE_KICK
	db 23, QUICK_ATTACK
	db 25, SWIFT
	db 27, CHARM
	db 30, BITE
	db 33, HAZE
	db 36, AURORA_BEAM
	db 41, CRUNCH
	db 45, ICE_BEAM
	db 47, ACID_ARMOR
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, THUNDERSHOCK
	db 8, SAND_ATTACK
	db 16, GROWL
	db 20, DOUBLE_KICK
	db 23, QUICK_ATTACK
	db 25, SWIFT
	db 27, CHARM
	db 30, BITE
	db 33, THUNDER_WAVE
	db 36, PIN_MISSILE
	db 41, CRUNCH
	db 45, THUNDERBOLT
	db 47, AGILITY
	db 52, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, EMBER
	db 8, SAND_ATTACK
	db 10, LEER
	db 12, FIRE_SPIN
	db 14, SMOG
	db 16, GROWL
	db 20, DOUBLE_KICK
	db 23, QUICK_ATTACK
	db 25, SWIFT
	db 27, CHARM
	db 30, BITE
	db 33, SCARY_FACE
	db 36, FLAMETHROWER
	db 41, CRUNCH
	db 45, DOUBLE_EDGE
	db 47, FOCUS_ENERGY
	db 52, FIRE_BLAST
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 9, AGILITY
	db 12, PSYBEAM
	db 18, BARRIER
	db 20, RECOVER
	db 24, SHARPEN
	db 27, THUNDER_WAVE
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 40, HYPER_BEAM
	db 44, ZAP_CANNON
	db 47, PSYCHIC_M
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 10, WATER_GUN
	db 11, LEER
	db 13, BITE
	db 15, ROCK_THROW
	db 19, ROLLOUT
	db 31, ANCIENTPOWER
	db 37, PROTECT
	db 43, CRUNCH
	db 46, ROCK_SLIDE
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BIDE
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 1, BITE
	db 10, WATER_GUN
	db 11, LEER
	db 13, BITE
	db 15, ROCK_THROW
	db 19, ROLLOUT
	db 31, ANCIENTPOWER
	db 37, PROTECT
	db 38, SPIKE_CANNON
	db 47, CRUNCH
	db 54, ROCK_SLIDE
	db 65, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 10, ABSORB
	db 11, LEER
	db 15, ROCK_THROW
	db 19, MEGA_DRAIN
	db 28, SAND_ATTACK
	db 31, ANCIENTPOWER
	db 37, ENDURE
	db 46, ROCK_SLIDE
	db 55, GIGA_DRAIN
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWORDS_DANCE
	db 1, SCRATCH
	db 1, HARDEN
	db 1, ABSORB
	db 1, SCREECH
	db 10, ABSORB
	db 11, LEER
	db 15, ROCK_THROW
	db 19, MEGA_DRAIN
	db 28, SAND_ATTACK
	db 31, ANCIENTPOWER
	db 37, ENDURE
	db 38, SLASH
	db 51, ROCK_SLIDE
	db 65, GIGA_DRAIN
	db 72, CROSS_CHOP
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 8, AGILITY
	db 15, BITE
	db 17, ROAR
	db 19, ROCK_THROW
	db 22, SUPERSONIC
	db 29, ANCIENTPOWER
	db 33, CRUNCH
	db 36, SCARY_FACE
	db 43, TAKE_DOWN
	db 46, ROCK_SLIDE
	db 50, HYPER_BEAM
	db 57, SKY_ATTACK
	db 63, DOUBLE_EDGE
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, AMNESIA
	db 12, LICK
	db 15, DEFENSE_CURL
	db 22, BELLY_DRUM
	db 29, HEADBUTT
	db 36, SNORE
	db 36, REST
	db 41, CRUNCH
	db 43, BODY_SLAM
	db 50, ROLLOUT
	db 52, DOUBLE_EDGE
	db 55, SLEEP_TALK
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POWDER_SNOW
	db 13, MIST
	db 25, AGILITY
	db 31, ANCIENTPOWER
	db 37, MIND_READER
	db 43, MIRROR_COAT
	db 49, ICE_BEAM
	db 55, WHIRLWIND
	db 61, REFLECT
	db 67, SKY_ATTACK
	db 73, BLIZZARD
	db 79, HAZE
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 25, AGILITY
	db 31, ANCIENTPOWER
	db 37, DETECT
	db 43, THUNDERBOLT
	db 49, DRILL_PECK
	db 55, RAIN_DANCE
	db 61, LIGHT_SCREEN
	db 67, SKY_ATTACK
	db 73, THUNDER
	db 79, ZAP_CANNON
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EMBER
	db 13, FIRE_SPIN
	db 25, AGILITY
	db 31, ANCIENTPOWER
	db 37, ENDURE
	db 43, SAFEGUARD
	db 49, FLAMETHROWER
	db 55, SUNNY_DAY
	db 61, SAFEGUARD
	db 67, SOLARBEAM
	db 73, SKY_ATTACK
	db 79, FIRE_BLAST
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 31, DRAGONBREATH
	db 36, AGILITY
	db 39, BODY_SLAM
	db 43, SAFEGUARD
	db 50, OUTRAGE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 33, DRAGONBREATH
	db 38, AGILITY
	db 41, BODY_SLAM
	db 47, SAFEGUARD
	db 56, OUTRAGE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, MIST
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 33, DRAGONBREATH
	db 38, AGILITY
	db 41, BODY_SLAM
	db 47, SAFEGUARD
	db 50, WING_ATTACK
	db 61, OUTRAGE
	db 75, HYPER_BEAM
	db 81, SKY_ATTACK
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, CONFUSE_RAY
	db 1, CONFUSION
	db 1, DISABLE
	db 1, PSYWAVE
	db 1, PSYBEAM
	db 11, BARRIER
	db 22, SWIFT
	db 33, PSYCH_UP
	db 44, FUTURE_SIGHT
	db 55, MIST
	db 66, PSYCHIC_M
	db 77, AMNESIA
	db 88, RECOVER
	db 99, SAFEGUARD
	db 100, AGILITY
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 10, TRANSFORM
	db 20, MEGA_PUNCH
	db 30, METRONOME
	db 40, PSYCHIC_M
	db 50, ANCIENTPOWER
	db 60, BARRIER
	db 70, AMNESIA
	db 80, MIMIC
	db 90, PSYWAVE
	db 100, BATON_PASS
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 22, SYNTHESIS
	db 25, SWEET_SCENT
	db 29, BODY_SLAM
	db 36, LIGHT_SCREEN
	db 43, SAFEGUARD
	db 45, HEAL_BELL
	db 50, SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, REFLECT
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 23, SYNTHESIS
	db 27, SWEET_SCENT
	db 31, BODY_SLAM
	db 39, LIGHT_SCREEN
	db 47, SAFEGUARD
	db 50, HEAL_BELL
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, REFLECT
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 23, SYNTHESIS
	db 27, SWEET_SCENT
	db 31, BODY_SLAM
	db 31, PETAL_DANCE
	db 41, LIGHT_SCREEN
	db 51, SAFEGUARD
	db 55, HEAL_BELL
	db 61, SOLARBEAM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 10, EMBER
	db 12, QUICK_ATTACK
	db 19, SWIFT
	db 22, DEFENSE_CURL
	db 24, FLAME_WHEEL
	db 28, ROLLOUT
	db 31, REVERSAL
	db 37, FLAMETHROWER
	db 40, DOUBLE_EDGE
	db 46, FIRE_BLAST
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 10, QUICK_ATTACK
	db 12, EMBER
	db 13, DOUBLE_KICK
	db 21, SWIFT
	db 24, DEFENSE_CURL
	db 27, FLAME_WHEEL
	db 31, ROLLOUT
	db 35, REVERSAL
	db 40, FLAMETHROWER
	db 46, DOUBLE_EDGE
	db 54, FIRE_BLAST
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 1, EMBER
	db 6, SMOKESCREEN
	db 10, QUICK_ATTACK
	db 12, EMBER
	db 13, DOUBLE_KICK
	db 21, SWIFT
	db 24, DEFENSE_CURL
	db 27, FLAME_WHEEL
	db 31, ROLLOUT
	db 35, REVERSAL
	db 47, FLAMETHROWER
	db 54, DOUBLE_EDGE
	db 60, FIRE_BLAST
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 7, RAGE
	db 11, WATER_GUN
	db 13, METAL_CLAW
	db 20, BITE
	db 22, FLAIL
	db 27, SCARY_FACE
	db 31, CRUNCH
	db 35, SLASH
	db 41, SCREECH
	db 43, THRASH
	db 46, SUBMISSION
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 7, RAGE
	db 11, WATER_GUN
	db 13, METAL_CLAW
	db 21, BITE
	db 24, FLAIL
	db 28, SCARY_FACE
	db 33, CRUNCH
	db 37, SLASH
	db 45, SCREECH
	db 47, THRASH
	db 51, SUBMISSION
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, AGILITY
	db 1, SCRATCH
	db 1, LEER
	db 1, RAGE
	db 1, WATER_GUN
	db 7, RAGE
	db 11, WATER_GUN
	db 13, METAL_CLAW
	db 21, BITE
	db 24, FLAIL
	db 28, SCARY_FACE
	db 36, CRUNCH
	db 38, SLASH
	db 47, SCREECH
	db 49, THRASH
	db 54, SUBMISSION
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FORESIGHT
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 17, FURY_SWIPES
	db 25, SLAM
	db 33, REST
	db 35, BODY_SLAM
	db 41, AMNESIA
	db 47, BATON_PASS
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, FORESIGHT
	db 1, DEFENSE_CURL
	db 1, QUICK_ATTACK
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 14, AGILITY
	db 18, FURY_SWIPES
	db 28, SLAM
	db 38, REST
	db 40, BODY_SLAM
	db 48, AMNESIA
	db 56, BATON_PASS
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, FORESIGHT
	db 11, PECK
	db 13, CONFUSION
	db 16, HYPNOSIS
	db 22, REFLECT
	db 25, PSYBEAM
	db 28, TAKE_DOWN
	db 34, DRILL_PECK
	db 37, DREAM_EATER
	db 43, PSYCHIC_M
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKY_ATTACK
	db 1, TACKLE
	db 1, GROWL
	db 1, FORESIGHT
	db 1, PECK
	db 6, FORESIGHT
	db 11, PECK
	db 13, CONFUSION
	db 16, HYPNOSIS
	db 18, WING_ATTACK
	db 25, REFLECT
	db 28, PSYBEAM
	db 33, TAKE_DOWN
	db 39, DRILL_PECK
	db 41, DREAM_EATER
	db 47, PSYCHIC_M
	db 55, DOUBLE_EDGE
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, SUPERSONIC
	db 15, COMET_PUNCH
	db 19, SWIFT
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 22, SAFEGUARD
	db 29, BATON_PASS
	db 36, RAZOR_WIND
	db 43, AGILITY
	db 46, DOUBLE_EDGE
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, SUPERSONIC
	db 15, COMET_PUNCH
	db 17, MACH_PUNCH
	db 22, SWIFT
	db 24, LIGHT_SCREEN
	db 24, REFLECT
	db 24, SAFEGUARD
	db 33, BATON_PASS
	db 42, RAZOR_WIND
	db 51, AGILITY
	db 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, CONSTRICT
	db 6, SCARY_FACE
	db 11, LEECH_LIFE
	db 17, NIGHT_SHADE
	db 23, PIN_MISSILE
	db 26, SLUDGE
	db 30, FURY_SWIPES
	db 37, SPIDER_WEB
	db 40, SLUDGE_BOMB
	db 44, SCREECH
	db 45, AGILITY
	db 47, MEGAHORN
	db 53, PSYCHIC_M
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWORDS_DANCE
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, SCARY_FACE
	db 1, CONSTRICT
	db 6, SCARY_FACE
	db 11, LEECH_LIFE
	db 17, NIGHT_SHADE
	db 19, FOCUS_ENERGY
	db 25, PIN_MISSILE
	db 28, SLUDGE
	db 34, FURY_SWIPES
	db 43, SPIDER_WEB
	db 46, SLUDGE_BOMB
	db 52, SCREECH
	db 53, AGILITY
	db 58, MEGAHORN
	db 63, PSYCHIC_M
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, WHIRLWIND
	db 1, SCREECH
	db 1, LEECH_LIFE
	db 1, SUPERSONIC
	db 1, GUST
	db 6, SUPERSONIC
	db 8, ABSORB
	db 10, ACID
	db 12, BITE
	db 17, WING_ATTACK
	db 19, CONFUSE_RAY
	db 21, SWIFT
	db 25, MEGA_DRAIN
	db 27, SLUDGE
	db 32, CRUNCH
	db 35, MEAN_LOOK
	db 40, GIGA_DRAIN
	db 45, SLUDGE_BOMB
	db 55, HAZE
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, THUNDER_WAVE
	db 5, SUPERSONIC
	db 9, THUNDERSHOCK
	db 13, FLAIL
	db 17, WATER_GUN
	db 25, SPARK
	db 29, CONFUSE_RAY
	db 31, BUBBLEBEAM
	db 37, TAKE_DOWN
	db 39, THUNDERBOLT
	db 41, HYDRO_PUMP
	db 45, DOUBLE_EDGE
	db 47, THUNDER
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, THUNDER_WAVE
	db 5, SUPERSONIC
	db 9, THUNDERSHOCK
	db 13, FLAIL
	db 17, WATER_GUN
	db 25, SPARK
	db 33, CONFUSE_RAY
	db 37, BUBBLEBEAM
	db 45, TAKE_DOWN
	db 51, THUNDERBOLT
	db 53, HYDRO_PUMP
	db 55, DOUBLE_EDGE
	db 58, THUNDER
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, CHARM
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, SWEET_KISS
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 4, ENCORE
	db 8, SING
	db 13, SWEET_KISS
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, CHARM
	db 4, DEFENSE_CURL
	db 9, POUND
	db 14, SWEET_KISS
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 1, POUND
	db 7, METRONOME
	db 13, SWIFT
	db 18, SWEET_KISS
	db 21, TAKE_DOWN
	db 25, ENCORE
	db 29, BODY_SLAM
	db 31, SAFEGUARD
	db 33, ANCIENTPOWER
	db 38, DOUBLE_EDGE
	db 41, BATON_PASS
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, WING_ATTACK
	db 1, GROWL
	db 1, CHARM
	db 1, POUND
	db 7, METRONOME
	db 13, SWIFT
	db 18, SWEET_KISS
	db 21, TAKE_DOWN
	db 25, ENCORE
	db 29, BODY_SLAM
	db 31, SAFEGUARD
	db 33, ANCIENTPOWER
	db 38, DOUBLE_EDGE
	db 41, BATON_PASS
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 1, CONFUSION
	db 10, NIGHT_SHADE
	db 20, TELEPORT
	db 25, PSYBEAM
	db 30, FUTURE_SIGHT
	db 35, DRILL_PECK
	db 40, CONFUSE_RAY
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKY_ATTACK
	db 1, PECK
	db 1, LEER
	db 1, CONFUSION
	db 10, NIGHT_SHADE
	db 20, TELEPORT
	db 24, WHIRLWIND
	db 30, PSYBEAM
	db 35, FUTURE_SIGHT
	db 40, DRILL_PECK
	db 45, CONFUSE_RAY
	db 55, PSYCHIC_M
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, THUNDERSHOCK
	db 14, THUNDER_WAVE
	db 18, TAKE_DOWN
	db 23, COTTON_SPORE
	db 25, CONFUSE_RAY
	db 30, LIGHT_SCREEN
	db 37, THUNDER
	db 39, DOUBLE_EDGE
	db 46, ZAP_CANNON
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, THUNDERSHOCK
	db 14, THUNDER_WAVE
	db 23, TAKE_DOWN
	db 27, COTTON_SPORE
	db 29, CONFUSE_RAY
	db 36, LIGHT_SCREEN
	db 45, THUNDER
	db 47, DOUBLE_EDGE
	db 56, ZAP_CANNON
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERBOLT
	db 1, OUTRAGE
	db 1, TACKLE
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 1, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 14, THUNDER_WAVE
	db 23, TAKE_DOWN
	db 27, COTTON_SPORE
	db 29, CONFUSE_RAY
	db 29, THUNDERPUNCH
	db 42, LIGHT_SCREEN
	db 57, THUNDER
	db 60, DOUBLE_EDGE
	db 65, ZAP_CANNON
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUNNY_DAY
	db 1, GIGA_DRAIN
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, PETAL_DANCE
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BUBBLE
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 19, TAKE_DOWN
	db 21, BUBBLEBEAM
	db 28, DOUBLE_EDGE
	db 36, RAIN_DANCE
	db 40, SUBMISSION
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, TAIL_WHIP
	db 1, BUBBLE
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 23, TAKE_DOWN
	db 25, BUBBLEBEAM
	db 36, DOUBLE_EDGE
	db 42, RAIN_DANCE
	db 46, SUBMISSION
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, MIMIC
	db 10, FLAIL
	db 19, LOW_KICK
	db 22, SLAM
	db 28, ROCK_SLIDE
	db 33, BODY_SLAM
	db 37, FAINT_ATTACK
	db 40, COUNTER
	db 46, DOUBLE_EDGE
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_BEAM
	db 1, HAZE
	db 1, MIST
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, PERISH_SONG
	db 35, AURORA_BEAM
	db 43, SWAGGER
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, ABSORB
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, LEECH_SEED
	db 22, MEGA_DRAIN
	db 25, COTTON_SPORE
	db 30, GIGA_DRAIN
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, SYNTHESIS
	db 1, TAIL_WHIP
	db 1, ABSORB
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 25, MEGA_DRAIN
	db 29, COTTON_SPORE
	db 36, GIGA_DRAIN
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, SYNTHESIS
	db 1, TAIL_WHIP
	db 1, ABSORB
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 25, MEGA_DRAIN
	db 33, COTTON_SPORE
	db 44, GIGA_DRAIN
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 12, BATON_PASS
	db 19, FURY_SWIPES
	db 22, SWIFT
	db 27, TAKE_DOWN
	db 36, SCREECH
	db 39, DOUBLE_EDGE
	db 46, AGILITY
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, GROWTH
	db 10, MEGA_DRAIN
	db 13, LEECH_SEED
	db 16, RAZOR_LEAF
	db 19, SUNNY_DAY
	db 22, GIGA_DRAIN
	db 31, SYNTHESIS
	db 37, DOUBLE_EDGE
	db 46, SOLARBEAM
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, POUND
	db 4, GROWTH
	db 10, MEGA_DRAIN
	db 13, LEECH_SEED
	db 16, RAZOR_LEAF
	db 19, SUNNY_DAY
	db 22, GIGA_DRAIN
	db 31, PETAL_DANCE
	db 37, DOUBLE_EDGE
	db 46, SOLARBEAM
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FORESIGHT
	db 7, QUICK_ATTACK
	db 13, DOUBLE_TEAM
	db 19, SONICBOOM
	db 25, DETECT
	db 27, PURSUIT
	db 28, SWIFT
	db 29, WING_ATTACK
	db 31, SUPERSONIC
	db 33, ANCIENTPOWER
	db 37, HYPNOSIS
	db 43, SCREECH
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 11, SLAM
	db 21, AMNESIA
	db 29, BODY_SLAM
	db 31, EARTHQUAKE
	db 41, RAIN_DANCE
	db 47, HYDRO_PUMP
	db 51, MIST
	db 51, HAZE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 11, SLAM
	db 23, AMNESIA
	db 31, BODY_SLAM
	db 35, EARTHQUAKE
	db 47, RAIN_DANCE
	db 53, HYDRO_PUMP
	db 59, MIST
	db 59, HAZE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, CONFUSION
	db 8, SAND_ATTACK
	db 16, GROWL
	db 20, DOUBLE_KICK
	db 23, QUICK_ATTACK
	db 25, SWIFT
	db 27, CHARM
	db 30, BITE
	db 33, MORNING_SUN
	db 36, PSYBEAM
	db 42, PSYCH_UP
	db 45, CRUNCH
	db 47, PSYCHIC_M
	db 52, FUTURE_SIGHT
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, PURSUIT
	db 8, SAND_ATTACK
	db 16, GROWL
	db 20, DOUBLE_KICK
	db 23, QUICK_ATTACK
	db 25, SWIFT
	db 27, CHARM
	db 29, CONFUSE_RAY
	db 30, BITE
	db 33, MOONLIGHT
	db 36, FAINT_ATTACK
	db 42, MEAN_LOOK
	db 45, CRUNCH
	db 47, SCREECH
	db 52, FUTURE_SIGHT
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 11, PURSUIT
	db 16, HAZE
	db 21, WING_ATTACK
	db 26, NIGHT_SHADE
	db 31, FAINT_ATTACK
	db 36, WHIRLWIND
	db 41, MEAN_LOOK
	db 46, DRILL_PECK
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, AMNESIA
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 10, WATER_GUN
	db 15, CONFUSION
	db 20, HEADBUTT
	db 28, BUBBLEBEAM
	db 29, DISABLE
	db 32, RAIN_DANCE
	db 36, REST
	db 38, PSYBEAM
	db 40, PSYCH_UP
	db 41, SWAGGER
	db 45, PSYCHIC_M
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, PSYWAVE
	db 6, SPITE
	db 12, CONFUSE_RAY
	db 19, MEAN_LOOK
	db 27, PSYBEAM
	db 32, SHADOW_BALL
	db 36, PAIN_SPLIT
	db 41, PSYCHIC_M
	db 46, PERISH_SONG
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, CHARM
	db 1, ENCORE
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 7, CONFUSION
	db 10, BITE
	db 13, STOMP
	db 20, AGILITY
	db 23, DOUBLE_KICK
	db 28, PSYBEAM
	db 30, BATON_PASS
	db 37, CRUNCH
	db 46, PSYCHIC_M
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 8, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, RAPID_SPIN
	db 29, BIDE
	db 36, EXPLOSION
	db 43, SPIKES
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, ZAP_CANNON
	db 1, TACKLE
	db 1, PROTECT
	db 8, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, RAPID_SPIN
	db 29, BIDE
	db 39, EXPLOSION
	db 49, SPIKES
	db 59, DOUBLE_EDGE
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 5, DEFENSE_CURL
	db 8, ROLLOUT
	db 13, GLARE
	db 16, PURSUIT
	db 18, SPITE
	db 20, SCREECH
	db 23, DIG
	db 26, ENDURE
	db 28, TAKE_DOWN
	db 30, ANCIENTPOWER
	db 33, BODY_SLAM
	db 38, DOUBLE_EDGE
	db 43, FLAIL
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 6, SAND_ATTACK
	db 13, HARDEN
	db 16, FURY_CUTTER
	db 20, QUICK_ATTACK
	db 26, WING_ATTACK
	db 28, FAINT_ATTACK
	db 30, SCREECH
	db 36, SLASH
	db 44, SWORDS_DANCE
	db 52, GUILLOTINE
	db 55, SKY_ATTACK
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, IRON_TAIL
	db 1, TACKLE
	db 1, SCREECH
	db 1, HARDEN
	db 7, CURSE
	db 10, BIND
	db 14, ROCK_THROW
	db 20, RAGE
	db 23, DRAGONBREATH
	db 25, SLAM
	db 27, DIG
	db 31, ROCK_SLIDE
	db 35, SANDSTORM
	db 38, BODY_SLAM
	db 43, EARTHQUAKE
	db 46, DOUBLE_EDGE
	db 49, CRUNCH
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 4, TAIL_WHIP
	db 8, CHARM
	db 13, BITE
	db 19, LICK
	db 22, HEADBUTT
	db 26, ROAR
	db 31, BODY_SLAM
	db 34, RAGE
	db 37, TAKE_DOWN
	db 43, CRUNCH
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, OUTRAGE
	db 1, TACKLE
	db 1, SCARY_FACE
	db 4, TAIL_WHIP
	db 8, CHARM
	db 13, BITE
	db 19, LICK
	db 22, HEADBUTT
	db 28, ROAR
	db 35, BODY_SLAM
	db 38, RAGE
	db 43, TAKE_DOWN
	db 51, CRUNCH
	db 59, DOUBLE_EDGE
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, TACKLE
	db 1, POISON_STING
	db 1, BUBBLE
	db 10, HARDEN
	db 10, MINIMIZE
	db 13, WATER_GUN
	db 19, ROLLOUT
	db 28, PIN_MISSILE
	db 33, BUBBLEBEAM
	db 37, TAKE_DOWN
	db 46, HYDRO_PUMP
	db 53, DESTINY_BOND
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, STEEL_WING
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 20, FURY_CUTTER
	db 24, AGILITY
	db 30, METAL_CLAW
	db 33, RAZOR_WIND
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 1, ROLLOUT
	db 1, BIDE
	db 9, WRAP
	db 14, ENCORE
	db 16, ROCK_THROW
	db 23, SAFEGUARD
	db 28, ROCK_SLIDE
	db 37, REST
	db 40, SPIDER_WEB
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, HORN_ATTACK
	db 12, ENDURE
	db 16, KARATE_CHOP
	db 19, FURY_ATTACK
	db 25, PIN_MISSILE
	db 27, COUNTER
	db 35, TAKE_DOWN
	db 37, REVERSAL
	db 44, MEGAHORN
	db 46, CROSS_CHOP
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, PURSUIT
	db 9, QUICK_ATTACK
	db 14, ICY_WIND
	db 17, SCREECH
	db 25, FAINT_ATTACK
	db 28, METAL_CLAW
	db 33, FURY_SWIPES
	db 35, ICE_BEAM
	db 41, AGILITY
	db 49, SLASH
	db 57, BEAT_UP
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 8, LICK
	db 15, FURY_SWIPES
	db 22, FAINT_ATTACK
	db 25, SWEET_SCENT
	db 29, REST
	db 30, CHARM
	db 36, SLASH
	db 43, SNORE
	db 50, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, SUBMISSION
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 1, FURY_SWIPES
	db 8, LICK
	db 15, FURY_SWIPES
	db 22, FAINT_ATTACK
	db 25, SWEET_SCENT
	db 29, REST
	db 29, SCARY_FACE
	db 39, SLASH
	db 49, SNORE
	db 59, THRASH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SMOG
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, HARDEN
	db 27, ANCIENTPOWER
	db 29, AMNESIA
	db 34, BODY_SLAM
	db 36, FLAMETHROWER
	db 41, RECOVER
	db 43, ROCK_SLIDE
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, EMBER
	db 1, ROCK_THROW
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, HARDEN
	db 27, ANCIENTPOWER
	db 29, AMNESIA
	db 34, BODY_SLAM
	db 36, FLAMETHROWER
	db 43, RECOVER
	db 48, ROCK_SLIDE
	db 60, EARTHQUAKE
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 10, POWDER_SNOW
	db 14, MUD_SLAP
	db 19, ENDURE
	db 21, ICY_WIND
	db 28, TAKE_DOWN
	db 35, FLAIL
	db 37, MIST
	db 40, EARTHQUAKE
	db 46, BLIZZARD
	db 48, AMNESIA
	db 55, DOUBLE_EDGE
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, ICE_BEAM
	db 1, HORN_ATTACK
	db 1, POWDER_SNOW
	db 1, ENDURE
	db 10, POWDER_SNOW
	db 14, MUD_SLAP
	db 19, ENDURE
	db 21, ICY_WIND
	db 28, TAKE_DOWN
	db 31, FURY_ATTACK
	db 40, THRASH
	db 42, MIST
	db 46, EARTHQUAKE
	db 56, BLIZZARD
	db 58, AMNESIA
	db 70, DOUBLE_EDGE
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 7, HARDEN
	db 13, BUBBLE
	db 19, RECOVER
	db 25, BUBBLEBEAM
	db 29, ROCK_SLIDE
	db 31, SPIKE_CANNON
	db 35, ENDURE
	db 37, MIRROR_COAT
	db 41, FLAIL
	db 43, ANCIENTPOWER
	db 47, EARTHQUAKE
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 11, LOCK_ON
	db 14, PSYBEAM
	db 18, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 33, FOCUS_ENERGY
	db 40, HYDRO_PUMP
	db 44, ICE_BEAM
	db 48, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 11, CONSTRICT
	db 14, PSYBEAM
	db 18, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 24, OCTAZOOKA
	db 38, FOCUS_ENERGY
	db 50, HYDRO_PUMP
	db 54, ICE_BEAM
	db 58, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 50, DRILL_PECK
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BUBBLE
	db 10, SUPERSONIC
	db 16, HEADBUTT
	db 18, BUBBLEBEAM
	db 23, PSYBEAM
	db 25, TAKE_DOWN
	db 27, WING_ATTACK
	db 32, AGILITY
	db 36, CONFUSE_RAY
	db 40, PSYCHIC_M
	db 46, DOUBLE_EDGE
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 9, SAND_ATTACK
	db 13, FURY_ATTACK
	db 17, METAL_CLAW
	db 19, SWIFT
	db 25, AGILITY
	db 28, SPIKES
	db 37, SLASH
	db 42, STEEL_WING
	db 45, DRILL_PECK
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, SMOG
	db 20, BITE
	db 24, BEAT_UP
	db 27, FAINT_ATTACK
	db 35, FLAMETHROWER
	db 43, CRUNCH
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, SMOG
	db 20, BITE
	db 26, BEAT_UP
	db 30, FAINT_ATTACK
	db 41, FLAMETHROWER
	db 46, CRUNCH
	db 52, FIRE_BLAST
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_BEAM
	db 1, DISABLE
	db 1, BUBBLE
	db 1, SMOKESCREEN
	db 1, LEER
	db 1, WATER_GUN
	db 8, SMOKESCREEN
	db 11, WATER_GUN
	db 15, LEER
	db 17, TWISTER
	db 22, BUBBLEBEAM
	db 26, FOCUS_ENERGY
	db 29, DRAGONBREATH
	db 31, AURORA_BEAM
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 60, OUTRAGE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 15, ROLLOUT
	db 17, FLAIL
	db 19, SLAM
	db 25, TAKE_DOWN
	db 33, CHARM
	db 41, ENDURE
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, BODY_SLAM
	db 1, HORN_ATTACK
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 15, ROLLOUT
	db 17, FLAIL
	db 19, SLAM
	db 24, FURY_ATTACK
	db 33, SCARY_FACE
	db 41, RAPID_SPIN
	db 49, EARTHQUAKE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 9, AGILITY
	db 12, PSYBEAM
	db 18, BARRIER
	db 20, RECOVER
	db 24, DEFENSE_CURL
	db 27, THUNDER_WAVE
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 40, HYPER_BEAM
	db 44, ZAP_CANNON
	db 47, PSYCHIC_M
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 8, LEER
	db 13, DOUBLE_KICK
	db 15, HYPNOSIS
	db 23, STOMP
	db 31, CONFUSE_RAY
	db 40, TAKE_DOWN
	db 43, JUMP_KICK
	db 49, DOUBLE_EDGE
	db 55, HI_JUMP_KICK
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FORESIGHT
	db 45, CROSS_CHOP
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROLLING_KICK
	db 7, FOCUS_ENERGY
	db 13, PURSUIT
	db 19, QUICK_ATTACK
	db 25, RAPID_SPIN
	db 31, COUNTER
	db 37, AGILITY
	db 43, DETECT
	db 49, TRIPLE_KICK
	db 55, CROSS_CHOP
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 9, SWEET_KISS
	db 13, POWDER_SNOW
	db 18, SCREECH
	db 21, CONFUSION
	db 25, SING
	db 31, PSYBEAM
	db 33, MEAN_LOOK
	db 37, PSYCHIC_M
	db 41, ICE_BEAM
	db 45, PERISH_SONG
	db 49, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 9, THUNDERPUNCH
	db 12, LOW_KICK
	db 17, LIGHT_SCREEN
	db 19, THUNDER_WAVE
	db 25, SWIFT
	db 33, SCREECH
	db 36, THUNDERBOLT
	db 41, CROSS_CHOP
	db 49, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, LEER
	db 13, SMOG
	db 15, FAINT_ATTACK
	db 17, LOW_KICK
	db 19, FIRE_PUNCH
	db 22, CONFUSE_RAY
	db 25, SMOKESCREEN
	db 29, FIRE_SPIN
	db 31, SUNNY_DAY
	db 37, FLAMETHROWER
	db 41, CROSS_CHOP
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, DEFENSE_CURL
	db 13, STOMP
	db 19, MILK_DRINK
	db 26, BIDE
	db 34, ROLLOUT
	db 41, SUBMISSION
	db 43, BODY_SLAM
	db 47, DOUBLE_EDGE
	db 53, HEAL_BELL
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, TAIL_WHIP
	db 10, SOFTBOILED
	db 13, DOUBLESLAP
	db 18, MINIMIZE
	db 20, TAKE_DOWN
	db 23, SING
	db 28, EGG_BOMB
	db 33, DEFENSE_CURL
	db 35, HEAL_BELL
	db 40, LIGHT_SCREEN
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, ROAR
	db 1, BITE
	db 1, LEER
	db 11, THUNDERSHOCK
	db 21, RAIN_DANCE
	db 31, SPARK
	db 41, CRUNCH
	db 51, REFLECT
	db 61, LIGHT_SCREEN
	db 71, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, SACRED_FIRE
	db 1, ROAR
	db 1, BITE
	db 1, LEER
	db 11, EMBER
	db 21, STOMP
	db 31, FIRE_SPIN
	db 41, CRUNCH
	db 51, FLAMETHROWER
	db 61, SWAGGER
	db 71, FIRE_BLAST
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BLIZZARD
	db 1, ROAR
	db 1, WATER_GUN
	db 1, BITE
	db 1, LEER
	db 1, BUBBLEBEAM
	db 11, RAIN_DANCE
	db 21, GUST
	db 31, AURORA_BEAM
	db 41, CRUNCH
	db 51, MIST
	db 61, MIRROR_COAT
	db 71, HYDRO_PUMP
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 36, SCARY_FACE
	db 43, CRUNCH
	db 50, EARTHQUAKE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, SANDSTORM
	db 1, SCREECH
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 38, SCARY_FACE
	db 47, CRUNCH
	db 56, EARTHQUAKE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, SANDSTORM
	db 1, SCREECH
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 38, SCARY_FACE
	db 47, CRUNCH
	db 61, EARTHQUAKE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, AEROBLAST
	db 11, SAFEGUARD
	db 22, GUST
	db 33, RECOVER
	db 44, HYDRO_PUMP
	db 55, RAIN_DANCE
	db 66, SWIFT
	db 77, WHIRLWIND
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 100, SKY_ATTACK
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, SACRED_FIRE
	db 11, SAFEGUARD
	db 22, GUST
	db 33, RECOVER
	db 44, FIRE_BLAST
	db 55, SUNNY_DAY
	db 66, SWIFT
	db 77, WHIRLWIND
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 100, SKY_ATTACK
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, RECOVER
	db 1, HEAL_BELL
	db 10, SAFEGUARD
	db 20, ANCIENTPOWER
	db 30, FUTURE_SIGHT
	db 40, BATON_PASS
	db 50, PERISH_SONG
	db 0 ; no more level-up moves
