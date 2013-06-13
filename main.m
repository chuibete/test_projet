function main
    clear all; close all; clc
    %L=[ 0 0 0 1 0; 0 0 1 1 1; 0 0 0 0 0; 0 1 1 0 0; 0 0 1 0 0 ]
    %number=input('Entrez la taille du Labyrinyhe: ');
    choice=menu('Choisissez la taille de votre labyrinthe',10,20,30);
    number=10*choice-1;
    L=round(100*rand(number,number))<25;
    
    [k,l] = size(L);
    depart=1 ;
    arrivee=k*l ;
    [G] = creerGraph(L);
    [chemin, distance] = dijkstra(depart,arrivee, G,L);
    afficherLabyrinthe(L,chemin);
end