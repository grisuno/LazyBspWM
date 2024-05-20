# LazyBspWM

![Bspwm](https://img.shields.io/badge/Window_Manager-Bspwm-5E81AC?style=flat-square)
![License](https://img.shields.io/github/license/grisuno/LazyBspWM?style=flat-square)

LazyBspWM es una configuración automatizada de bspwm, diseñada para proporcionar un entorno de escritorio ligero y personalizable. Esta configuración incluye varios scripts y ajustes predefinidos para optimizar tu experiencia con bspwm.

## Instalación

Sigue estos pasos para instalar y configurar LazyBspWM:

1. Clona el repositorio:
    ```bash
    git clone https://github.com/grisuno/LazyBspWM.git
    cd LazyBspWM
    ```

2. Ejecuta el script de instalación:
    ```bash
    chmod +x lazybspwm.sh
    ./lazybspwm.sh
    ```

3. Reinicia tu sesión para aplicar los cambios.

## Requisitos

Este proyecto requiere los siguientes paquetes:

- bspwm
- sxhkd
- compton
- feh
- polybar
- zsh
- zsh-syntax-highlighting
- zsh-autosuggestions
- rofi
- gnome-terminal
- google-chrome
- gksudo
- bat
- lsd
- xclip

El script de instalación se encargará de instalar todos estos paquetes automáticamente.

## Uso

Después de reiniciar tu sesión, bspwm debería estar configurado y listo para usar con todas las personalizaciones incluidas. Aquí hay algunos atajos de teclado útiles:

- **Super + Enter**: Abre el terminal (gnome-terminal).
- **Super + D**: Abre el lanzador de aplicaciones (rofi).
- **Super + Shift + G**: Abre Google Chrome.
- **Super + Ctrl + B**: Abre Burpsuite Professional.

Para obtener una lista completa de atajos de teclado, revisa el archivo `~/.config/sxhkd/sxhkdrc`.

## Personalización

Puedes personalizar bspwm y los componentes adicionales editando los archivos de configuración ubicados en `~/.config/bspwm`, `~/.config/sxhkd`, `~/.config/compton`, y `~/.config/polybar`.

## Agradecimientos

Un agradecimiento especial a [s4vitar](https://github.com/s4vitar) por la configuración original en la que se basa este proyecto.

## Licencia

Este proyecto está licenciado bajo la Licencia Pública General de GNU v3.0. Para más detalles, consulta el archivo [LICENSE](LICENSE).

---

Hecho con ❤️ por [grisuno](https://github.com/grisuno).
