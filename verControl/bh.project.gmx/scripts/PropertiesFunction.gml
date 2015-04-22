globalvar FuncProp;
FuncProp = ds_map_create()
FuncProp[? "ShowMessage"] = ds_list_create()
ds_list_add( FuncProp[? "ShowMessage"], F_ARG_STRING )
