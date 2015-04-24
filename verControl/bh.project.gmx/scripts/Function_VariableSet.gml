if !ds_map_exists(vars,argument0){
    Function_VariableAdd(argument0,argument1)
}
vars[? argument0] = real(argument1)
Function_ConsoleSendString("Variable: '"+argument0+"' set to: "+string(real(argument1))+".")
