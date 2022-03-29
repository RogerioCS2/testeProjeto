function IniciarJogo(){
	if(room == Menu){
		var direitaAtiva = keyboard_check(vk_right);
		var esquerdaAtiva = keyboard_check(vk_left);
		var ativarSelecao = keyboard_check(ord("A"));

		if(direitaAtiva){
			direita = true;	
			esquerda = false;
			x = 508; y = 425;	
		}

		if(esquerdaAtiva){
			direita = false;	
			esquerda = true;
			x = 180; y = 425;	
		}

		if(esquerda && ativarSelecao){				
			room_goto(TelaTransicao);				
		}
	}
	
}

function UpdateMenu(){	
	 IniciarJogo();	 
}