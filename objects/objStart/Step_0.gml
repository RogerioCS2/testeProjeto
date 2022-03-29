var animaStart = keyboard_check_pressed(btn);	
if(animaStart){	
	sprite_index = botaoAcionado;
	//show_debug_message("Acionei o Botao Pause: " + string(sprite_index));	
}else{
	sprite_index = botaoSolto;
}