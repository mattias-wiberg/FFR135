% Modified sign function to return 1 if x = 0 else same as sign.

function val = Sgn(x)
    val = sign(x);
    val(val==0) = 1;
end