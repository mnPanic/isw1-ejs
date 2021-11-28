# TusLibros it4

Grupo 11, integrantes

| Nombre               | LU     | Mail de zoom                  |
| -------------------- | ------ | ----------------------------- |
| Manuel Panichelli    | 72/18  | panicmanu@gmail.com           |
| Agustin Frenkel      | 737/18 | afus.frenkel@gmail.com        |
| Ignacio Alonso Rehor | 195/18 | ignacio.alonso@exactas.uba.ar |

## Uso del sistema

Para usar el sistema, basta con levantar el rest server del cliente de tus
libros y luego abrir la ventana de Login. Para ello, ejecutar en un workspace:

```smalltalk
TusLibrosRestServer cleanUpAndListenOn: 8080.
TusLibrosLoginWindow open.
```

El único usuario válido es `haw` con contraseña
[`hunter2`](http://bash.org/?244321), cualquier otra llevará a un error de
Login. Las tarjetas distinguidas son dos, el resto siendo válidas:

- `4509790000000000`: Tarjeta robada
- `4509790000006789`: Tarjeta sin fondos

Ya que es un POC, los *text boxes* tienen por default valores válidos para
facilitar su uso.

Para salir, basta con cerrar las ventanas.
