# dwm-6.1-multi.patch

Sobre o DWM e patches:

- http://dwm.suckless.org/

Download do DWM:

- http://dl.suckless.org/dwm/dwm-6.1.tar.gz



Descompacte o source "dwm-6.1.tar.gz" e entre no diretório "dwm-6.1" e aplique o patch :

````
$ cd dwm-6.1

$ cp config.def.h config.h

$ patch -p1 < /local-onde-esta-o-patch/dwm-6.1-multi.patch

````

Para o dmenu usei este patch

- https://github.com/zezaocapoeira/DMENU-patch/blob/master/dmenu-4.6/dmenu-4.6.patch


Para que as alterações do dmenu tenham efeito deve-se usar o exemplo abaixo:

````
/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-i", "-l", "8", "-fn", "Droid Sans Mono Bold-10",
                                 "-x", "10", "-y", "20", "-w", "300", "-nb", "#191919", "-nf", "#9ac0cd", "-sb",
                                 "#191919", "-sf", "#bf3f34", "-p", "MENU➫", NULL };
````

Obrigado pela atenção , salve !!!
