extends MarginContainer

# Called to display a Witch.
var progress:bool = false
var summoned_witch = witches.witch_array.back()
var sil1 = preload("res://assets/sil1.png")
var sil2 = preload("res://assets/sil2.png")
var sil3 = preload("res://assets/sil3.png")
var deep0 = preload("res://assets_faces/z0.jpeg")
var deep1 = preload("res://assets_faces/z1.jpeg")
var deep2 = preload("res://assets_faces/z2.jpeg")

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    if magic.bad_end:
        var deep_one = randi()%3
        $Rise.play()
        yield(get_tree().create_timer(1), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "34D EZD"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = "151.2"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = "1.453"
        yield(get_tree().create_timer(0.25), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "YAN ERE"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = "1640.9"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = "-14.856"
        yield(get_tree().create_timer(0.25), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "Y4ZD3R3"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Atk").text = "BAD"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = "18925.5"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = "-154.856"
        get_node("Card/MarginContainer/VBoxContainer/MarginContainer/FlavourText").text = "5dfd23ds6881fsdf22sdf5dfs5"
        yield(get_tree().create_timer(0.25), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "YAD EZD"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Atk").text = "BAC"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Def").text = "END"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = "999999"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = "-666.126"
        get_node("Card/MarginContainer/VBoxContainer/MarginContainer/FlavourText").text = "5dfd23ds6881fsdf22sdf5dfs5"
        yield(get_tree().create_timer(0.25), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "34D 3ND"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Atk").text = "BAD"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Def").text = "MZD"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = "----"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = "----"
        get_node("Card/MarginContainer/VBoxContainer/MarginContainer/FlavourText").text = "4it4's745not3.6roe34nt3gen"
        yield(get_tree().create_timer(0.25), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "BAD END"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Atk").text = "B D"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Def").text = " ND"
        get_node("Card/MarginContainer/VBoxContainer/MarginContainer/FlavourText").text = "8i74825638455g785g345f344d"
        yield(get_tree().create_timer(0.25), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "3AD ERE"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Atk").text = "BAD"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Def").text = "END"
        get_node("Card/MarginContainer/VBoxContainer/MarginContainer/FlavourText").text = "badendbadendbadendbadendba"
        yield(get_tree().create_timer(0.25), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "BAD END"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Atk").text = " AD"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Def").text = "EN "
        get_node("Card/MarginContainer/VBoxContainer/MarginContainer/FlavourText").text = "badendbadendbadendbadendbadendbadendbadend"
        yield(get_tree().create_timer(0.25), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Atk").text = "BAD"
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/Def").text = "END"   
        get_node("Card/MarginContainer/VBoxContainer/MarginContainer/FlavourText").text = "badendbadendbadendbadendbadendbadendbadendbadendbadendbadend"

        $Rise.stop()
        $Fall.play()
        match deep_one:
            0:
                get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = deep0
            1:
                get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = deep1
            2:
                get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = deep2
    else:
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = sil1
        $Blip.play()
        yield(get_tree().create_timer(0.5), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = sil2
        $Blip.play()
        yield(get_tree().create_timer(0.5), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = sil3
        $Blip.play()
        yield(get_tree().create_timer(0.5), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = sil1
        $Blip.play()
        yield(get_tree().create_timer(0.5), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = sil2
        $Blip.play()
        yield(get_tree().create_timer(0.3), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = sil3
        $Blip.play()
        yield(get_tree().create_timer(0.3), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = sil1
        $Blip.play()
        yield(get_tree().create_timer(0.3), "timeout")
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = sil2
        $Blip.play()
        yield(get_tree().create_timer(1), "timeout")
        #Now, SUMMON THE WITCH!
        #namae, stars, facefile, ATK, DEF, ability index (0 for now)
        get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = summoned_witch[0]
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic/Stars").texture = load("res://assets/star"+String(summoned_witch[1])+".png")
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load(summoned_witch[2])
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = String(summoned_witch[3])
        get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = String(summoned_witch[4])
        
        yield(get_tree().create_timer(0.5), "timeout")
        if summoned_witch[1] == 1 or summoned_witch[1] == 2:
            $Jingle1.play()
        elif summoned_witch[1] == 3 or summoned_witch[1] == 4:
            $Jingle2.play()
        else:
            $Jingle3.play()
        yield(get_tree().create_timer(0.75), "timeout")
        progress = true
        
func _input(event):
    if event is InputEventMouseButton and progress == true:
        if event.button_index == BUTTON_LEFT and event.pressed:
            switcher.playClick()
            get_tree().paused = false
            if (witches.witch_array.size() >= 13):
                switcher.switchScene("res://victoryscreen.tscn")
            queue_free()
