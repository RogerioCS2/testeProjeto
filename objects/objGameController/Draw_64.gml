if(room != Menu && room != TelaTransicao){
	draw_text(40, 50, "TIME: " + string(tempoJogo));
	draw_text(450, 50, "POINTS: " + string(totalPontos));
	draw_text(room_width - 120, 50, "LEFT: " + string(poximaFase));
}

if(room == TelaTransicao){
	draw_set_font(ftTransicao);	
	draw_text(450, 220, "STAGE: " + string(faseAtual));
	draw_set_font(-1);	
}