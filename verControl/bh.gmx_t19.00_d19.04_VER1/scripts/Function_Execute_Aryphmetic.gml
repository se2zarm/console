var t1, t2, znak;
t1 = argument0
t2 = argument1
znak = argument2
switch(znak){
    case "+": return t1+t2; break;
    case "-": return t1-t2; break;
    case "*": return t1*t2; break;
    case "/": return t1/t2; break;
    case "^": return power(t1,t2); break;
}
