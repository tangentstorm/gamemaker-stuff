var LKEY = ord('A'), RKEY = ord('E'), UKEY = 188 /* , */, DKEY = ord('O');
var MAXSPEED = 10;
var gr = 30; // gun radius
var kb = 0.05; // kickback
with objShip {
  // calculate new heading:
  hx = 0; if keyboard_check(LKEY) hx-=1; if keyboard_check(RKEY) hx+=1;
  hy = 0; if keyboard_check(UKEY) hy-=1; if keyboard_check(DKEY) hy+=1;
  // velocity based on heading, location based on velocity
  if (hx!=0 || hy!=0) { var a = arctan2(hy, hx); dy += sin(a); dx += cos(a); }
  else { dx *= 0.99; dy *= 0.99; }
  // gun angle based on mouse position:
  var a = point_direction(x, y, mouse_x, mouse_y);
  objBlast.image_angle = a;

  // friction and max velocity
  dx = clamp(dx, -MAXSPEED, MAXSPEED); dy = clamp(dy, -MAXSPEED, MAXSPEED);
  x += dx; y += dy; objBlast.x = x; objBlast.y = y;
  
  // firing has slight kickback
  if mouse_check_button(mb_left) {
    var r = degtorad(a); dx -= cos(r)*kb; dy += sin(r)*kb; 
    var o = instance_create(x + gr*cos(r),y - gr*sin(r),objBullet);
    o.direction = a; o.speed = 10;
  }
}
