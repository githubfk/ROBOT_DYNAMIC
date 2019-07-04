%坐标系建在杆件的前面
function Ti = Chuandi_matrix(alphai, ai, di, thetai)
  
  Ti = [cos(thetai)             -sin(thetai)                0                ai;
       sin(thetai)*cos(alphai)   cos(thetai)*cos(alphai)   -sin(alphai)     -sin(alphai)*di;
       sin(thetai)*sin(alphai)   cos(thetai)*sin(alphai)    cos(alphai)      cos(alphai)*di            ;
       0                         0                          0                1             ];
  