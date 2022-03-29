#region Pausar o Jogo

jogoPausado = false;
pausarJogo = false;
mudouSituacao = false;

#endregion	
#region Declaração de Variaveis Globais

globalvar numeroBombas;
globalvar totalBombas;
globalvar totalPontos;
globalvar numeroInimigos;
globalvar poximaFase;
globalvar explosaoBomba;
globalvar tempoJogo;
globalvar faseAtual;
globalvar proximaFase;
globalvar tempoTransicao;
globalvar fases;

#endregion
#region Atribuindo Valor Para as Variaveis

fases = [
	TelaTransicao,
	Stage01, 
	Stage02, 
	Stage03, 
	Stage04 	
];

explosaoBomba = 1;
poximaFase = 2;
faseAtual = 1;
numeroBombas = 1;
totalBombas = 1;
numeroInimigos = 7;
totalPontos = 00;
tempoJogo = 200;
minuto = room_speed * 3;
tempoTransicao = 150;

#endregion