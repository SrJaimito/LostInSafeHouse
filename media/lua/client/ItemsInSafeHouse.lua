local function LISH_OnKeyPressed(keycode)
    if keycode == 53 then
        print("Tecla de mod pulsada")
    end
end

Events.OnKeyPressed.Add(LISH_OnKeyPressed)
