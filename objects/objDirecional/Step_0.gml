cima = keyboard_check(vk_up);
baixo = keyboard_check(vk_down);
direita = keyboard_check(vk_right);
esquerda = keyboard_check(vk_left);	

var botalSolto = !baixo && !cima && !direita && !esquerda;
if(botaoSolto){sprite_index = botaoSolto;}
if(cima){sprite_index = botaoCimaAcionado;}
if(baixo){sprite_index = botaoBaixoAcionado;}
if(direita){sprite_index = botaoDireitaAcionado;}
if(esquerda){sprite_index = botaoEsquerdaAcionado;}