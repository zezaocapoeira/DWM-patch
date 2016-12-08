# dwm-6.0-multi.patch

Sobre o DWM e patches:

- http://dwm.suckless.org/

Download do DWM:

- http://dl.suckless.org/dwm/dwm-6.0.tar.gz



Descompacte o source "dwm-6.0.tar.gz" e entre no diretório "dwm-6.0" e aplique o patch :

````
$ patch -p1 < /local-onde-esta-o-patch/dwm-6.0-multi.patch

````

Para o dmenu usei este patch

- https://github.com/zezaocapoeira/i3wm-dmenu-patch/blob/master/dmenu-patch/dmenu.patch


Para que as alterações do dmenu tenham efeito deve-se usar o exemplo abaixo:

````
/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-i", "-l", "8", "-o", "0.9", "-fn", "Monospace Bold-10",
                                 "-x", "10", "-y", "20", "-w", "300", "-nb", "#191919", "-nf", "#9ac0cd", "-sb",
                                 "#191919", "-sf", "#bf3f34", "-p", "MENU➫", NULL };
````
# Screenshot

![DWM-patch](https://raw.githubusercontent.com/zezaocapoeira/DWM-patch/master/dwm-6.0/screenshot/dwm-screen1.png)

![DWM-patch](https://raw.githubusercontent.com/zezaocapoeira/DWM-patch/master/dwm-6.0/screenshot/dwm-screen2.png)

![DWM-patch](https://raw.githubusercontent.com/zezaocapoeira/DWM-patch/master/dwm-6.0/screenshot/dwm-screen3.png)

Obrigado pela atenção, salve!!!
