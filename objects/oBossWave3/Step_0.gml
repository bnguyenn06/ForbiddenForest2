if(hp <= 500){
	sprite_index = 	sTHE_ANGERY_SLIME_KING;
}

// enemey movement
if instance_exists(oHero){
dir = point_direction(x,y,oHero.x,oHero.y);
}

xspd = lengthdir_x(spd,dir);
yspd = lengthdir_y(spd,dir);

//get the correct face for the enemy
if xspd > 0
{
	face = 1;	
}
if xspd < 0
{
	face = -1;	
}
image_xscale = face;

x += xspd;
y += yspd;

//receive damage
if place_meeting(x, y, oDamageEnemy)
{
	var _inst = instance_place(x, y, oDamageEnemy);		
	
	//take damage from specific instance
	hp -= _inst.damage;
	
	//tell the damage instance to destroy itself
	_inst.destroy = true;
}

if hp <= 0 
{
	//save new highscore if highest
    if(global.mins*60 + global.seconds) > (global.high_mins*60+global.high_seconds){


    //set new highscore
    global.high_mins=global.mins;
    global.high_seconds=global.seconds;

    newWinner=1;


    highscore_save();

    }
	instance_destroy();
	global.EnemiesKCount += 1;
	global.enemySpawn1 += 1;
	global.enemySpawn2 += 1;
	global.enemySpawn3 += 1;
	room_goto(r_congrats);
	
}





