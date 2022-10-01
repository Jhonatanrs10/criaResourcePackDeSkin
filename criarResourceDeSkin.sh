#!/usr/bin/env bash
//
// Gerador de Resource de Skins Minecraft 1.8
// Importa a Skin em um Resource Pack de Textura possibilitando o uso da Skin sem Internet
// Mudando a skin do Steve e Alex para a skin do Resource Pack
//
// Como usar?
//
// Coloque as skins.png na pasta Skins não coloque espaço no nome dos arquivos png após isso execute o .sh
// Ex.: bash ./criarResourceDeSkin.sh
// Sera criado uma pasta resourcepacks com os Resource Pack
//
criaResources(){
	for skin in `ls Skins`
	do
		mkdir novaSource
		mkdir resourcepacks
		cp -a "source"/* novaSource
		cp -a Skins/$skin novaSource/assets/minecraft/textures/entity/alex.png
		cp -a Skins/$skin novaSource/assets/minecraft/textures/entity/steve.png
		cp -a Skins/$skin novaSource/pack.png
		cd novaSource 
		zip -r $skin.zip *
		mv $skin.zip ../resourcepacks
		cd ..
		rm -r novaSource
	done
}

criaResources