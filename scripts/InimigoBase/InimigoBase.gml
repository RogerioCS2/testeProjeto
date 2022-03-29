function SelecionarDirecao(){	
	direcaoInimigo = choose(1, 2);	
	if(direcaoInimigo == 1){
		velHorizontalInimigo = -2;
		velVerticalInimigo = 0;
	}
	if(direcaoInimigo >= 2){
		velHorizontalInimigo = 0;
		velVerticalInimigo = -2;
	}
	contadorSelecao = 0;	
}

function AnimacaoInimigo(){
	//show_debug_message("Não Sou o inimigo Base");
	if(velHorizontalInimigo > 0){sprite_index = animacao[0];}
	if(velHorizontalInimigo < 0){sprite_index = animacao[1];}
	if(velVerticalInimigo < 0){sprite_index = animacao[2];}
	if(velVerticalInimigo > 0){sprite_index = animacao[3];}	
}

function MovimentoInimigo(){
	//show_debug_message("Maquina Estado: " + string(estadoGeral));
	if(estado == Game.normal){
		repeat(abs(velHorizontalInimigo)){
			colHorizontalInimigo = (!place_meeting(x + sign(velHorizontalInimigo), y, objParede) 
									&& !place_meeting(x + sign(velHorizontalInimigo), y, objBloco)
									&& !place_meeting(x + sign(velHorizontalInimigo), y, objParedeExterna)
									&& !place_meeting(x + sign(velHorizontalInimigo), y, objInimigoBase)									
									&& !place_meeting(x + sign(velHorizontalInimigo), y, objBomba));								
			if(colHorizontalInimigo){
				x += sign(velHorizontalInimigo);		
			}else{			
				velHorizontalInimigo *= -1;
				contadorSelecao++;
				break;
			}	
		}
	
		repeat(abs(velVerticalInimigo)){
			colVerticalInimigo = (!place_meeting(x, y + sign(velVerticalInimigo), objParede) 
									&& !place_meeting(x, y + sign(velVerticalInimigo), objBloco) 
									&& !place_meeting(x, y + sign(velVerticalInimigo), objParedeExterna)
									&& !place_meeting(x, y + sign(velVerticalInimigo), objInimigoBase)									
									&& !place_meeting(x, y + sign(velVerticalInimigo), objBomba));								
			if(colVerticalInimigo){
				y += sign(velVerticalInimigo);				
			}else{	
				velVerticalInimigo *= -1;
				contadorSelecao++;
				break;
			}	
		}
	
		var semColisao = (!place_meeting(x, y - sprite_height, objParede)) && (!place_meeting(x - sprite_width, y, objParede));
		var numeroColisoes = choose(2, 3, 4);
		//show_debug_message("Numero Colisoes: " + string(numeroColisoes));
		if(contadorSelecao >= numeroColisoes && semColisao){
			velVerticalInimigo = 0;
			velHorizontalInimigo = 0;
			SelecionarDirecao();		
		}
		
		if(sprite_index != sprInimigoBase){
			AnimacaoInimigo();			
		}
	}
}

function UpdateInimigo(){	
	MovimentoInimigo();
}