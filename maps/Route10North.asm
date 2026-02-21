Route10North_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	return

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd PokecenterSignScript

PowerPlant2FSign:
	jumptext PowerPlant2FSignText

PowerPlantSignText:
	text "CENTRALE ELETTRICA"
	line "di KANTO"
	done

PowerPlant2FSignText:
	text "Shh… È un segreto!"
	line "@"
	text_decimal wSecretID, 2, 5
	text_start
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  1, ROUTE_10_POKECENTER_1F, 1
	warp_event  7,  9, POWER_PLANT, 1
	warp_event  5,  6, POWER_PLANT_2F, 1
	warp_event 16,  7, POWER_PLANT_2F, 2

	def_coord_events

	def_bg_events
	bg_event  9, 11, BGEVENT_READ, PowerPlantSign
	bg_event 16,  1, BGEVENT_READ, Route10PokecenterSign
	bg_event  6,  6, BGEVENT_RIGHT, PowerPlant2FSign

	def_object_events
