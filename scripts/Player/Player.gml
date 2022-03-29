function ColisaoPlayer(){
	repeat(abs(velHorizontalPlayer)){
		colHorizontalPlayer = (!place_meeting(x + sign(velHorizontalPlayer), y, objParede) 
								&& !place_meeting(x + sign(velHorizontalPlayer), y, objBloco)
								&& !place_meeting(x + sign(velHorizontalPlayer), y, objParedeExterna));								
		if(colHorizontalPlayer){
			x += sign(velHorizontalPlayer);		
		}else{
			velHorizontalPlayer = 0;				
			break;
		}	
	}
	
	repeat(abs(velVerticalPlayer)){
		colVerticalPlayer = (!place_meeting(x, y + sign(velVerticalPlayer), objParede) 
								&& !place_meeting(x, y + sign(velVerticalPlayer), objBloco) 
								&& !place_meeting(x, y + sign(velVerticalPlayer), objParedeExterna));
								
		if(colVerticalPlayer){
			y += sign(velVerticalPlayer);				
		}else{	
			velVerticalPlayer = 0;
			break;
		}	
	}
}

function AnimacaoPlayer(){
	if(velHorizontalPlayer != 0 || velVerticalPlayer != 0){
		sprite_index = sprPlayerAndando;		
	}else{
		sprite_index = sprPlayerParado;
	}	
}

function MovimentoPlayer(){
	var podeMovimentar = (estado != Game.pausado) && estado != Game.gameOver;
	if(podeMovimentar){
		//show_debug_message("Estou sendo chamado");
		cima = keyboard_check(vk_up);
		baixo = keyboard_check(vk_down);
		direita = keyboard_check(vk_right);
		esquerda = keyboard_check(vk_left);	
	
		velHorizontalPlayer = (direita - esquerda) * velocidade;
		velVerticalPlayer = (baixo - cima) * velocidade;	
		ColisaoPlayer();
		AnimacaoPlayer();
	}	
}

function SoltarBomba(){
	var podeSoltarBomba = (estado != Game.pausado) && (estado != Game.gameOver);
	if(podeSoltarBomba){
		largarBomba = keyboard_check_pressed(ord("A"));
		if(largarBomba && numeroBombas <= totalBombas){
			numeroBombas++;
			instance_create_layer(x, y - 32, layer, objBomba);		
		}
	}
}

function GameOver(){
	var levouDano = (place_meeting(x, y, objInimigoBase)) || (place_meeting(x, y, objChamaBaixo));
	if(levouDano){		
		room_goto(TelaGameOver);		
		//estado = Game.gameOver;				
	}	
}

function UpdatePlayer(){
	GameOver();
	MovimentoPlayer();
	SoltarBomba();
}