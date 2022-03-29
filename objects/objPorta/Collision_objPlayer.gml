if(instance_exists(objPlayer)){
	//if(estado == Game.portaLiberada){	
		room_goto(TelaTransicao);
		estado = Game.pausado;
		objPlayer.x = 48;
		objPlayer.y = 160;
		faseAtual++;
		poximaFase++;
		tempoJogo = 200;		
	//}
}