du = 8; dx=0; dy=0
if keyboard_check(vk_up) dy -= du;
if keyboard_check(vk_down) dy += du;
if keyboard_check(vk_left) dx -= du;
if keyboard_check(vk_right) dx += du;


while (abs(dx)+abs(dy)>4) && !place_free(x+dx, y+dy) { 
  dx-=sign(dx); dy-=sign(dy)
}
nx = x + dx; ny = y + dy;
if nx < 0 nx = room_width + nx;
if (nx > room_width) nx %= room_width
if ny < 0 ny = room_height + ny;
if (ny > room_height) ny %= room_height
if place_free(nx, ny) { x=nx; y=ny }

if dx==0 {
    gw = 32; hgw = gw div 2 // grid width for snapping
    dx = x mod gw; if (dx < hgw) x -= dx else x += gw-dx
}
if dy==0 {
    gh = 32; hgh = gh div 2 // grid height for snapping
    dy = y mod gh; if (dy < hgh) y -= dy else y += gh-dy
}

