-- Checking to see if the user has mining
isMiningKnown = IsSpellKnown(2580, false)

-- Checking to see if the user has herbalism
isHerbalismKnown = IsSpellKnown(2383, false)

-- Setting the default switching timer
switchingTimer = 2

-- Setting a variable for what is being currently tracked
currentlyTracking = ''

-- Seeing if tracking switching is enabled
trackingSwitching = true

--Creating the function for casting track minerals
function castTrackMinerals()
    if (isMiningKnown == true) then
        CancelTrackingBuff()
        CastSpellByID(2580)
        currentlyTracking = 'minerals'
    end
end

--Creating the function for casting track herbs
function castTrackHerbs()
    if (isHerbalismKnown == true) then
        CancelTrackingBuff()
        CastSpellByID(2383)
        currentlyTracking = 'herbs'
    end
end

--Creating the function for switching between tracking
function switchTracking()
    if (currentlyTracking == 'minerals') then
        castTrackHerbs()
    elseif (currentlyTracking == 'herbs') then
        castTrackMinerals()
    else
        castTrackMinerals()
    end
end

--Timer for switching
--C_Timer.After(2, switchTracking)
--C_Timer.After(switchingTimer, switchTracking)

while isTracking == true do
    switchTracking()
    --Need the delay here
    --I tried using the built in delay function but it doesn't delay this loop
    --C_Timer.After(switchingTimer, switchTracking)
    --Can I put the whole while in a funcion I wonder
end


--EOF test line
print("EOF")