if !ds_map_exists(vars,argument0){
    vars[? argument0] = argument1
    Function_ConsoleSendString("New variable: '"+argument0+"' set to: "+string(argument1)+".")
}else{
    Function_ShowError("Variable "+argument0+" already exists!");
}
