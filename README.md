# My ZSH

Existen distintos frameworks que te ayudan a configurar _zsh_, pero aquí vamos hacerlo sin usar ninguno de estos. No es ni mejor ni peor usar (o no) los frameworks, pero a mí me gusta saber en todo momento por donde voy caminando, es decir, me gusta saber que estoy usando, las funciones de las que dispongo y como desarrollar o integrar nuevas. Por ello que cocine yo hoy la configuración de _zsh_. 

## Instalación de _zsh_

Para Ubuntu en mi caso. Dependerá del sistema operativo que tenga usted.

```
sudo apt install zsh
```

Fácil, ¿verdad?

Y la definimos como la _shell_ por defecto del usuario.

```
chsh -s $(which zsh)
```


## Primeros pasos configurando _zsh_

Clonamos el repositorio en la ubicación `$HOME/.config`.

```
git clone https://github.com/romnct/zsh.git $HOME/.config 
```

Y movemos el archivo `.zprofile` a `$HOME`.

```
mv $HOME/.config/zsh/.zprofile $HOME
```

Y creamos los directorios donde irán los plugins y los temas de la _zsh_.

```
mkdir $HOME/.config/zsh/themes $HOME/.config/zsh/plugins/src
```

### Descargar los plugins y el tema

Una vez todo colocado en su sitio (o en el que queráis si sabéis lo que estáis haciendo) vamos a descargar los plugins y el tema.

#### Plugins

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

#### Tema

- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

### Instalación

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/plugins/src
```

```
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/zsh/plugins/src
```

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.config/zsh/plugins/themes
```

## Acerca de la configuración

Vamos a detallar que estamos haciendo. Comenzaremos hablando de los archivos (o directorios) que integran el repositorio.

| Directorio/Archivo | Descripción |
| --- | --- |
| **_/config_** 	| Directorio donde se alojarán los archivos de configuración de zsh |
| **_/plugins_** 	| Directorio donde se alojarán los plugins de zsh |
| **_./.zprofile_** | Archivo que es leído una vez cuando iniciamos sesión en la shell |
| **_./.zshrc_** 		| Archivo que es leído cada vez que abrimos una shell	|

### ¿Por qué esta disposición?

Me resulta más cómodo separar cada cosa por su forma de ser, por ejemplo, el archivo `config/history` solo abarca todo lo relacionado con el historial de la _zsh_. Entonces, si continuamos detallando veremos que existen más archivos como `config/history`con una única función.

| Archivo | Descripción |
| --- | --- |
| **_./config/.p10k.zsh_** 	| Configuración de la [powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| **_./config/aliases.zsh_** 	| Alias declarados para la _zsh_ |
| **_./config/completion.zsh_** | Funciones y configuración de _completions_ de _zsh_ |
| **_./config/history.zsh_** 		| Configuración del historial de la _zsh_	|
| **_./plugins/plugins.zsh_** 		| Definición de los plugins que integraremos en la _zsh_	|

### Hablemos de lo que es importante

La mayoría de archivos son simples de entender tan solo con la descripción dada, pero, si es posible que existan, al menos uno, que requiera un poco más de detalle.

#### Hablemos de `./config/completion.zsh`

En este archivo se encuentra la configuración del _**zsh completion**_. Creo que todos conocemos que es el sistema de completado (o finalización) que tienen las _shells_ como _bash_ o, en nuestro caso, _zsh_. 

A continuación, vamos a detallar que es cada línea del archivo.

```
autoload -U compinit
```

`autoload` carga la función `compinit` _**(zsh completion)**_ en la sesión en la cual estemos trabajando de la _shell_. La opción `-U` evita que se expandan alias si existiese alguno que se denominara igual que la función `compinit`. Nunca en la práctica.

```
compinit
```

Inicializamos la función `compinit`.

```
_comp_options+=(globdots)
```

Esta opción le indicada a _zsh_ que también debe incluir los archivos ocultos en el sistema de completado.

Antes de explicar las siguientes líneas, indicar que `zstyle`es un comando del módulo `zsh/zutil` que permite definir estilos (en nuestro caso). Sigue el siguiente modelo `:completion:<function>:<completer>:<command>:<argument>:<tag>`.

```
zstyle ':completion:*' menu select
```

Muestra un menu donde muestra las posibles opciones de completado en lugar de ir a ciegas.

![Menu de completado](https://imgr.co/cache/img/3e733df6a2c0c39455ae73f3777f4f8c.jpg)
```
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
```

Muestra una descripción de las opciones de completado. En **amarillo en la anterior imagen**.

-   `%F{<color>} %f` - Cambia el color del texto`<color>`.
-   `%K{<color>} %k` - Cambia el color de fondo `<color>`.
-   `%B %b` - Negrita.
-   `%U %u` - Subrayado.

```
zstyle ':completion:*' file-list all
```

![Lista de archivos](https://imgr.co/cache/img/43d88ede6bc136cca929ba23e3dca7a9.jpg)
Lista los archivos para completar.
