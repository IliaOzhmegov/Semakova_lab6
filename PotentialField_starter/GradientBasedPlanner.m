function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% ????????? ????? ???? ?? ????????? ?? ????????? ????????? ??????? f 
% ??????? ??????:
%     start_coords ? end_coords -- ?????????? ????????? ? ???????? ?????
%     max_its -- ???????????? ????? ????????? ???????? 
% ???????? ??????:
%     route -- ?????? ?? 2 ???????? ? n ?????
%     ?????? ?????? ????????????? ??????????? x, y ?????? (?? ???? ??????????? ????)

[gx, gy] = gradient (-f);

% *******************************************************************
% ??? ??? ?????? ?????????? ?????
route = start_coords;

i = 1;

delta_x = 0;
delta_y = 0;

scale = 1;
tmpx=[];
tmpy=[];
while i <= 300 || norm(route(end, :) - end_coords) < 2.0
    
    if i > 390
        ii = 1;
    end
    dx = gy(route(end, 1), route(end, 2)) + delta_x;
    dy = gx(route(end, 1), route(end, 2));
    
%     tmpx = [tmpx dx];
     
    scale = norm([dx dy]);
    dx = dx/scale;
    dy = dy/scale;
    
    apprx_dx = round(dx);
    apprx_dy = round(dy);
    
    delta_x = (dx - apprx_dx)*scale;
    delta_y = (dy - apprx_dy)*scale;
    
    newx = route(i, 1) + apprx_dx;
    newy = route(i, 2) - apprx_dy;
    
    if newx < 0
        foo = 11;
    end
%     
%     disp(newx);
%     disp(newy);
%     disp('\n');
%     
    
    route = [route; newx, newy];
    
    i = i + 1;
end

% *******************************************************************

end
