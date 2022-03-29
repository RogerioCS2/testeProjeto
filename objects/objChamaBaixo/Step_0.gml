var destruirChama = (estado != Game.gameOver) && (estado != Game.pausado); 
if(destruirChama){
	tempo++;
	if(tempo > tempoChama){
		instance_destroy();
	}
}

if(place_meeting(x, y, objParede) || place_meeting(x, y, objParedeExterna)){
	instance_destroy();	
}

//show_debug_message("Numero Bombas" + string(numeroBombas));