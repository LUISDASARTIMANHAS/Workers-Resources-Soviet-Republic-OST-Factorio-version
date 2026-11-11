local LDA = require("__LDA-LIB__/init")

local function CreateInterludeAmbientSound(nameTrack, volume, spaceLocationId)
	local prototype = LDA.utils.CreateInterludeAmbientSound(nameTrack, volume, spaceLocationId)

	prototype.planetoptional = nil
	if spaceLocationId then
		prototype.planets = { spaceLocationId }
	else
		prototype.play_on_all_surfaces = true
	end

	return prototype
end

return CreateInterludeAmbientSound
