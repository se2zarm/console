var stroka, dlina, tokeni, pozicia, slovo, simvol, perechisl, t1, t2, znak;
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


