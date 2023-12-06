% use the argument principle to determine the square containing the zero
% return the square that contains the zero
function result = square_search(f, square_loc)
mid_left = (square_loc(4) + square_loc(1)) / 2;
mid_bottom = (square_loc(1) + square_loc(2)) / 2;
mid_right = (square_loc(2) + square_loc(3)) / 2;
mid_top = (square_loc(3) + square_loc(4)) / 2;
mid_center = (square_loc(1) + square_loc(3)) / 2;
func = matlabFunction(f);
top_left = square_contour(func,  [mid_left, mid_center, mid_top, square_loc(4)]);
top_right = square_contour(func, [mid_center, mid_right, square_loc(3), mid_top]);
bot_left = square_contour(func,  [square_loc(1), mid_bottom, mid_center, mid_left]);
bot_right = square_contour(func, [mid_bottom, square_loc(2), mid_right, mid_center]);

if norm(top_left) > 0.99
    result = [top_left, mid_left, mid_center, mid_top, square_loc(4)];
elseif norm(top_right) > 0.99
    result = [top_right, mid_center, mid_right, square_loc(3), mid_top];
elseif norm(bot_left) > 0.99
    result = [bot_left, square_loc(1), mid_bottom, mid_center, mid_left];
elseif norm(bot_right) > 0.99
    result = [bot_right, mid_bottom, square_loc(2), mid_right, mid_center];
else
    result = [0, square_loc(1), square_loc(2), square_loc(3), square_loc(4)];
end

end



function result = square_contour(func, boundary)
top = gaussian_quad(func, boundary(4), boundary(3));
right = gaussian_quad(func, boundary(3), boundary(2));
bottom = gaussian_quad(func, boundary(2), boundary(1));
left = gaussian_quad(func, boundary(1), boundary(4));
result = top + bottom + left + right;
end