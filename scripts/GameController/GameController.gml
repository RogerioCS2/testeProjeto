function PausarJogo(){
	pausarJogo = keyboard_check_pressed(ord("D"));	
	if(pausarJogo && !mudouSituacao && !jogoPausado){		
		mudouSituacao = true;
		jogoPausado = true;
		estadoGeral = Game.pausado;
	}
	
	if(pausarJogo && !mudouSituacao && jogoPausado){
		mudouSituacao = true;
		jogoPausado = false;
		estadoGeral = Game.normal;
	}
	mudouSituacao = false;
}


function Time(){
	if(estado == Game.normal || estado == Game.portaLiberada){
		 minuto--;
		 if(minuto <= 0){
			 minuto = room_speed * 3;		
			 tempoJogo--;			
		 }		 
		 if(tempoJogo < 0){			
			estado = Game.gameOver;
			room_goto(TelaGameOver);
		 }
	}
}

function AbrirPorta(){
	if(numeroInimigos <= 0){
		estado = Game.portaLiberada;
	}
}

function AnimaTelaTransicao(){
	if(room == TelaTransicao){		
		tempoTransicao--;
		if(tempoTransicao <= 0){
			var fase = fases[faseAtual]; 
			room_goto(fase);
			estado = Game.normal;
			tempoTransicao = 150;			
		}
	}
		
	if(room == TelaGameOver){	
		show_debug_message("Estou na tela GameOver");
		estado = Game.gameOver;		
		tempoTransicao--;
		
		if(tempoTransicao <= 0){				
			tempoTransicao = 150;
			instance_destroy(objPlayer);
			game_restart();	
			//room_restart();
		}		
	}	
}

function UpdateGameCotroller(){	
	AnimaTelaTransicao();
	AbrirPorta()
	Time();
	PausarJogo();	
}
