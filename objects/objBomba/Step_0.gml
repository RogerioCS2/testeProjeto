var podeExplodirBomba = (estado != Game.gameOver) && (estado != Game.pausado);
if(podeExplodirBomba){
	tempo++;
	if(tempo > tempoBomba){
		instance_destroy();
	}
}

//show_debug_message("Numero Bombas" + string(numeroBombas));