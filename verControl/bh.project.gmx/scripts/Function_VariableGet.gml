if ds_map_exists(vars,argument0){
    return vars[? argument0];
}else{
    Function_ShowError("Variable "+argument0+" doesn't exists!");
    return -1;
}
