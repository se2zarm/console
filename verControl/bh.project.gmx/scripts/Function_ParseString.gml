var stroka, dlina, tokeni, pozicia, slovo, simvol, perechisl, t1, t2, znak, size, key, q;
stroka = argument0 + " "
dlina = string_length(stroka)
tokeni = ds_list_create(); perechisl = ds_list_create()
slovo = ""
for(pozicia=1; pozicia<=dlina; pozicia++){
    simvol = string_char_at(stroka,pozicia) 
    if ds_list_find_index(Razdeliteli,simvol)>=0{ // Если символ - разделитель
    
        if slovo != ""{
            ds_list_add(tokeni,slovo) // добавляем слово
            slovo = ""
        }
        
        if simvol!=" "{
            ds_list_add(tokeni,simvol) // не пробел - добавляем разделитель
        }
    }else{
        slovo += simvol
    }
}

stroka = ""
for(pozicia=0; pozicia<ds_list_size(tokeni); pozicia++){ // ОТЛАДКА
    //Function_ConsoleSendString(tokeni[| pozicia])
}

if ds_list_size(tokeni) == 3{  // 2 элемента и знак
    if  ( string_is_real(tokeni[| 0]) or ds_map_exists(vars,tokeni[| 0]) ) &&
        ( string_is_real(tokeni[| 2]) or ds_map_exists(vars,tokeni[| 2]) ) &&
  (-1)!=ds_list_find_index(operator,tokeni[| 1]){
        //Function_ConsoleSendString("Schitaem!!! Ura!")
            if(string_is_real(tokeni[| 0])){
                t1 = real(tokeni[| 0])
            }else{
                if (ds_map_exists(vars,tokeni[| 0])){
                    t1 = vars[? tokeni[| 0] ]
                }
            }
            
            if(string_is_real(tokeni[| 2])){
                t2 = real(tokeni[| 2])
            }else{
                if (ds_map_exists(vars,tokeni[| 2])){
                    t2 = vars[? tokeni[| 2] ]
                }
            }
            znak = tokeni[| 1]
            Function_ConsoleSendString( Function_Execute_Aryphmetic(t1,t2,znak) )
  }
    if  !string_is_real(tokeni[| 0]) &&
        ( string_is_real(tokeni[| 2]) or ds_map_exists(vars,tokeni[| 2]) ) &&
        tokeni[| 1] == "="{
            t1 = tokeni[| 0]
                if(string_is_real(tokeni[| 2])){
                    t2 = real(tokeni[| 2])
                }else{
                    if (ds_map_exists(vars,tokeni[| 2])){
                        t2 = vars[? tokeni[| 2] ]
                    }
                }
            Function_VariableSet(t1,t2)
    }
}

//Теперь смотрим переменные

size = ds_map_size(vars);

if (-1)!=ds_list_find_index(tokeni,"listvar"){
    if size>0{
    key = ds_map_find_last(vars);
    
        for (q = size-1; q > -1; q-- ){
            if ds_map_exists(vars,key){
                Function_ConsoleSendString(key + ": " + string( vars[? key] ))
                key = ds_map_find_previous(vars, key)
            } else break;
        }
    }else{
        Function_ConsoleSendString("There are no variables set yet.")
    }   
}

if tokeni[| 0] == "setcolor" && ds_list_size(tokeni)==2 {
    if (string_pos("color`",tokeni[| 1])==1){
            q = getcolor(tokeni[| 1])
        }else{
            if string_is_real(tokeni[| 1]){
                q = real(tokeni[| 1])
            }else{
                Function_ConsoleSendString("Color have to start with: color` or to be an integer number")
                q = c_black
            }
        }
        draw_set_color(q) 
        Function_ConsoleSendString("Color set to "+string(q))
}

if tokeni[| 0] == "bgcolor" && ds_list_size(tokeni)==2 {
    if (string_pos("color`",tokeni[| 1])==1){
            q = getcolor(tokeni[| 1])
        }else{
            if string_is_real(tokeni[| 1]){
                q = real(tokeni[| 1])
            }else{
                Function_ConsoleSendString("Color have to start with: color` or to be an integer number")
                q = c_black
            }
        }
        background_colour = q
        Function_ConsoleSendString("Background color set to "+string(q))
}


