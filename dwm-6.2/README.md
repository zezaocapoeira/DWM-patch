# dwm-6.2-multipatch.patch/dwm-6.2-multipatch-v2.patch

Sobre o DWM e patches:

- http://dwm.suckless.org/

Download do DWM:

- https://github.com/zezaocapoeira/DWM-patch/raw/master/dwm-6.2/dwm-6.2.tar.gz



Descompacte o source "dwm-6.2.tar.gz" e entre no diretório "dwm-6.1" e aplique o patch :

````
$ cd dwm-6.2

$ cp config.def.h config.h

$ patch -p1 < /local-onde-esta-o-patch/dwm-6.1-multipatch.patch

````

Para o dmenu usei este patch

- https://github.com/zezaocapoeira/DMENU-patch/blob/master/dmenu-4.9/dmenu-4.9.patch


Para que as alterações do dmenu tenham efeito deve-se usar o exemplo abaixo:

````
/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-i", "-l", "8", "-fn", "Droid Sans Mono Bold-10",
                                 "-x", "10", "-y", "20", "-w", "300", "-nb", "#191919", "-nf", "#9ac0cd", "-sb",
                                 "#191919", "-sf", "#bf3f34", "-p", "MENU➫", NULL };
````

OBS:

- Algumas configurações estão personalizadas, caso revise o arquivo config.h e faça as devidas adaptações. Por exemplo:

ajustar as cores, tipo de fonte.

Indicar qual terminal que vai usar.

etc ...

- Nesse patch a alteração abaixo está desabilitada:

https://git.suckless.org/dwm/commit/cb3f58ad06993f7ef3a7d8f61468012e2b786cab.html

- fonte dos patches

https://dwm.suckless.org/patches/


Obrigado pela atenção , salve !!!
