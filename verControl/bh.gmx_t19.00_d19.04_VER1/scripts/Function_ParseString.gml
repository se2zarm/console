/*

int ? int

*/

var stroka, dlina, tokeni, pozicia, slovo, simvol, perechisl, t1, t2, znak;
stroka = argument0 + " "
dlina = string_length(stroka)
tokeni = ds_list_create()
perechisl = ds_list_create()
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
    Function_ConsoleSendString(tokeni[| pozicia])
}

Function_ConsoleSendString("Razmer: " + string(ds_list_size(tokeni)))
Function_ConsoleSendString("Token 0 is_real: "+string(string_is_real(tokeni[| 0])))
Function_ConsoleSendString("Token 2 is_real: "+string(string_is_real(tokeni[| 2])))
Function_ConsoleSendString("Token 1 in list: "+string(ds_list_find_index(operator,tokeni[| 1])))

if ds_list_size(tokeni) == 3{  // 2 элемента и знак

    if  string_is_real(tokeni[| 0]) &&
        string_is_real(tokeni[| 2]) &&
  (-1)!=ds_list_find_index(operator,tokeni[| 1]){
        Function_ConsoleSendString("Schitaem!!! Ura!")
            t1 = real(tokeni[| 0])
            t2 = real(tokeni[| 2])
            znak = tokeni[| 1]
            Function_ConsoleSendString( Function_Execute_Aryphmetic(t1,t2,znak) )
    }
    
    if  !string_is_real(tokeni[| 0]) &&
        string_is_real(tokeni[| 2]) &&
        tokeni[| 1] == "="{
            
            t1 = tokeni[| 0]
            t2 = tokeni[| 2]
            
            
                Function_VariableSet(t1,t2)
            
    }
}
