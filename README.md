# My ZSH

Existen distintos frameworks que te ayudan a configurar _zsh_, pero aquí vamos hacerlo sin usar ninguno de estos. No es ni mejor ni peor usar los frameworks, pero a mí me gusta saber en todo momento que estoy usando, las funciones de las que dispongo y como desarrollar nuevas.

## Primeros pasos configurando _zsh_

Primero, le indicamos a la _zsh_ el directorio de configuración del usuario definiendo la variable de entorno `ZDOTDIR`.

```
echo 'export ZDOTDIR="$HOME/.config/zsh"' > $HOME/.zshenv
```

Clonamos el repositorio en la ubicación `$HOME/.config/zsh`.

```
git clone https://github.com/romnct/zsh.git $HOME/.config/zsh
```

Por último, si queremos, definimos que la _shell_ por defecto del usuario sea la ***zsh***.

```
chsh -s $(which zsh)
```

## Plugins y temas

Una vez todo colocado en su sitio (o en donde queráis si sabéis lo que estáis haciendo) vamos a descargar los plugins y el tema.

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/plugins/src/zsh-syntax-highlighting
```

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/zsh/plugins/src/zsh-autosuggestions
```

[powerlevel10k](https://github.com/romkatv/powerlevel10k)

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.config/zsh/themes/powerlevel10k
```

## Acerca de la configuración

Vamos a detallar que estamos haciendo. Comenzaremos hablando de los archivos (o directorios) que integran el repositorio.

| Directorio/Archivo | Descripción |
| --- | --- |
| **_$HOME/.zshenv_** | Archivo de configuración que es leído cada vez que abrimos una shell que contiene las variables de entorno |
| **_$HOME/.config/zsh/_** | Directorio donde se alojarán los archivos de configuración de zsh |
| **_$HOME/.config/zsh/.zshrc_** | Archivo de configuración que es leído cada vez que abrimos una shell que carga la configuración de los plugins, alias, temas, etc. |
| **_$HOME/.config/zsh/config_** | Directorio donde se alojarán los archivos de configuración del archivo .zshrc |
| **_$HOME/.config/zsh/plugins_** | Directorio donde se alojarán los plugins de zsh |

### ¿Por qué esta disposición?

Me resulta más cómodo separar cada cosa por su forma de ser, por ejemplo, en el archivo `config/history` solo incluirá opciones o funcionalidades relacionadas con el historial de la _zsh_.

| Archivo | Descripción |
| --- | --- |
| **_./config/p10k.zsh_** | Configuración de la [powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| **_./config/aliases.zsh_** | Alias declarados para la _zsh_ |
| **_./config/completion.zsh_** | Funciones y configuración de _completions_ de _zsh_ |
| **_./config/history.zsh_** | Configuración del historial de la _zsh_ |
| **_./plugins/plugins.zsh_** | Definición de los plugins que integraremos en la _zsh_ |

### Hablemos de lo que es importante

La mayoría de archivos son simples de entender tan solo con la descripción dada, pero, existe uno que si requiere un poco más de detalle.

#### Hablemos de `config/completion.zsh`

En este archivo se encuentra la configuración del _**zsh completion**_. Creo que todos conocemos que es el sistema de completado (o finalización) que tienen las _shells_ como _bash_ o, en nuestro caso, _zsh_. 

| Línea | Descripción |
| --- | --- |
| **`autoload -U compinit`** | `autoload` carga la función `compinit` _**(zsh completion)**_ en la sesión actual de la _shell_. La opción `-U` evita que se expandan el alias si existiese alguno que se denominara igual que la función `compinit` |
| **`compinit`** | Inicializa la función `compinit` |
| **`_comp_options+=(globdots)`** | Esta opción le indicada a _zsh_ que también debe incluir los archivos ocultos en el sistema de completado |
| **`zstyle ':completion:*' menu select`** | Muestra un menu donde muestra las posibles opciones de completado |
| **`zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'`** | Muestra una descripción de los elementos |
| **`zstyle ':completion:*' file-list all`** | Muestra el menú en forma de lista |

`zstyle`es un comando del módulo `zsh/zutil` que permite definir estilos. Sigue el siguiente modelo `:completion:<function>:<completer>:<command>:<argument>:<tag>`.

-   `%F{<color>} %f` - Cambia el color del texto`<color>`.
-   `%K{<color>} %k` - Cambia el color de fondo `<color>`.
-   `%B %b` - Negrita.
-   `%U %u` - Subrayado.

![Menu de completado](https://imgr.co/cache/img/3e733df6a2c0c39455ae73f3777f4f8c.jpg)

![Lista de archivos](https://imgr.co/cache/img/43d88ede6bc136cca929ba23e3dca7a9.jpg)
