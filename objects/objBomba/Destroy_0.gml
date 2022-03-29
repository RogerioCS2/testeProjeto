if(numeroBombas > 0){numeroBombas--;}
repeat(explosaoBomba){
	instance_create_layer(x + 60 * numeroVoltas / 2, y + 14, layer, objChamaDireita);	
	instance_create_layer(x - 25 * numeroVoltas, y + 14, layer, objChamaEsquerda);	
	instance_create_layer(x + 5, y - 25  * numeroVoltas, layer, objChamaCima);	
	instance_create_layer(x + 5, y + 60  * numeroVoltas / 2, layer, objChamaBaixo);
	numeroVoltas++;
	//show_debug_message("Numero de Volras: " + string(numeroVoltas));
}
