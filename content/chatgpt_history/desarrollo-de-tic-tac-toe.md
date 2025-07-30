---
title: Desarrollo de Tic Tac Toe
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Con base en el tutorial del tiktaktoe de React explicame
  los pasos ordenados que se usaron para diseñar el juego. Ejemplo: crea la funcion
  de square, pasa el estado de square a board, etc... Numera los pasos"
draft: false
---

# Desarrollo de Tic Tac Toe

## ✅ TODOs
- [ ] s los cuadrados en un arreglo.

## 🧠 Full Chat

🙋 **You:**

Con base en el tutorial del tiktaktoe de React explicame los pasos ordenados que se usaron para diseñar el juego. Ejemplo: crea la funcion de square, pasa el estado de square a board, etc... Numera los pasos

---

🤖 **Assistant:**

El tutorial de Tic Tac Toe (Tres en línea) de React es un ejemplo clásico para aprender los conceptos básicos de React, incluido el uso de componentes, estado, y propiedades (props). A continuación, se describen los pasos ordenados comúnmente utilizados para construir el juego, basándonos en el enfoque del tutorial oficial de React (hasta mi última actualización en abril de 2023). Ten en cuenta que este resumen puede variar ligeramente dependiendo de la versión del tutorial que estés siguiendo o de las personalizaciones que decidas implementar:

1. **Crea el componente `Square`**:
    - Este componente representa cada cuadro del tablero de Tic Tac Toe.
    - Inicialmente, puede ser simplemente un botón que llama a una función cuando se hace clic en él.

2. **Almacena el estado en el componente `Square`**:
    - Usa el Hook `useState` para que el componente `Square` mantenga su propio estado.
    - El estado inicialmente puede representar el valor del cuadrado ("X", "O", o null).

3. **Levanta el estado al componente `Board`**:
    - En lugar de tener el estado en cada componente `Square`, mueve el estado al componente `Board`.
    - El `Board` mantiene el estado de todos los cuadrados en un arreglo.

4. **Haz que el `Board` controle los cuadrados**:
    - El `Board` pasa una función al `Square` que se llama cuando se hace clic en un cuadrado.
    - Esta función actualiza el estado del `Board` basado en el cuadrado que fue clickeado.

5. **Agrega el turno de los jugadores**:
    - Alterna entre cada jugador ("X" y "O") cada vez que se hace un movimiento.
    - Esto se puede manejar dentro del estado del componente `Board`.

6. **Declara un ganador**:
    - Añade lógica para determinar el ganador del juego verificando si hay tres cuadrados con el mismo valor en una línea.
    - Muestra un mensaje con el ganador.

7. **Permite jugar de nuevo**:
    - Añade un botón para reiniciar el juego, lo que puede restablecer el estado del juego a su estado inicial.

8. **Almacena un historial de movimientos**:
    - Modifica el estado del juego para almacenar un historial de movimientos realizados.
    - Permite a los jugadores "viajar en el tiempo" y ver el estado del tablero en pasos anteriores.

9. **Muestra los movimientos pasados**:
    - Añade una lista que muestra los movimientos pasados y permite a los jugadores hacer clic en ellos para volver a ese estado del juego.

10. **Optimización y mejora**:
    - Implementa mejoras de rendimiento, como evitar renders innecesarios.
    - Añade características adicionales según desees, como la colocación de los botones de movimiento en un orden específico o mejorar la interfaz de usuario.

Cada uno de estos pasos introduce conceptos importantes de React, como el manejo de estados, el levantamiento del estado, la inmutabilidad, y cómo React rastrea los cambios para actualizar la interfaz de usuario eficientemente. Este enfoque paso a paso no solo te ayuda a construir un juego funcional de Tic Tac Toe, sino que también enseña prácticas fundamentales de desarrollo en React que son aplicables a proyectos mucho más grandes y complejos.

---

🙋 **You:**

Como puedo refactorizar el tutorial de react como si fuera un react y nodejs senior developer
import { useState } from 'react';

function Square({ value, onSquareClick }) {
  return (
    <button className="square" onClick={onSquareClick}>
      {value}
    </button>
  );
}

function Board({ xIsNext, squares, onPlay }) {
  function handleClick(i) {
    if (calculateWinner(squares) || squares[i]) {
      return;
    }
    const nextSquares = squares.slice();
    if (xIsNext) {
      nextSquares[i] = 'X';
    } else {
      nextSquares[i] = 'O';
    }
    onPlay(nextSquares);
  }

  const winner = calculateWinner(squares);
  let status;
  if (winner) {
    status = 'Ganador: ' + winner;
  } else {
    status = 'Siguiente jugador: ' + (xIsNext ? 'X' : 'O');
  }

  return (
    <>
      <div className="status">{status}</div>
      <div className="board-row">
        <Square value={squares[0]} onSquareClick={() => handleClick(0)} />
        <Square value={squares[1]} onSquareClick={() => handleClick(1)} />
        <Square value={squares[2]} onSquareClick={() => handleClick(2)} />
      </div>
      <div className="board-row">
        <Square value={squares[3]} onSquareClick={() => handleClick(3)} />
        <Square value={squares[4]} onSquareClick={() => handleClick(4)} />
        <Square value={squares[5]} onSquareClick={() => handleClick(5)} />
      </div>
      <div className="board-row">
        <Square value={squares[6]} onSquareClick={() => handleClick(6)} />
        <Square value={squares[7]} onSquareClick={() => handleClick(7)} />
        <Square value={squares[8]} onSquareClick={() => handleClick(8)} />
      </div>
    </>
  );
}

export default function Game() {
  const [history, setHistory] = useState([Array(9).fill(null)]);
  const [currentMove, setCurrentMove] = useState(0);
  const xIsNext = currentMove % 2 === 0;
  const currentSquares = history[currentMove];

  function handlePlay(nextSquares) {
    const nextHistory = [...history.slice(0, currentMove + 1), nextSquares];
    setHistory(nextHistory);
    setCurrentMove(nextHistory.length - 1);
  }

  function jumpTo(nextMove) {
    setCurrentMove(nextMove);
  }

  const moves = history.map((squares, move) => {
    let description;
    if (move > 0) {
      description = 'Ir hacia la jugada #' + move;
    } else {
      description = 'Ir al inicio del juego';
    }
    return (
      <li key={move}>
        <button onClick={() => jumpTo(move)}>{description}</button>
      </li>
    );
  });

  return (
    <div className="game">
      <div className="game-board">
        <Board xIsNext={xIsNext} squares={currentSquares} onPlay={handlePlay} />
      </div>
      <div className="game-info">
        <ol>{moves}</ol>
      </div>
    </div>
  );
}

function calculateWinner(squares) {
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a];
    }
  }
  return null;
}

---

🤖 **Assistant:**

Refactorizar el código de un proyecto como el juego de Tic Tac Toe del tutorial de React implica optimizar la estructura del código, mejorar la legibilidad, y potencialmente añadir características avanzadas o mejoras de rendimiento. Aquí te muestro cómo podrías abordar la refactorización de este código desde la perspectiva de un desarrollador senior en React y Node.js:

### 1. **Separación de Preocupaciones**

Separa el código en archivos más pequeños, agrupando la lógica relacionada. Esto mejora la legibilidad y facilita el mantenimiento. Por ejemplo, puedes tener archivos separados para `Square.js`, `Board.js`, `Game.js`, y `utilities.js` (para funciones como `calculateWinner`).

### 2. **Uso de Hooks Personalizados**

Para manejar la lógica del estado del juego de forma más abstracta y reutilizable, considera crear hooks personalizados. Por ejemplo, un hook `useGameState` podría encapsular toda la lógica relacionada con el manejo del historial de movimientos, el cálculo del jugador actual, y la determinación del ganador.

```jsx
function useGameState() {
  const [history, setHistory] = useState([Array(9).fill(null)]);
  const [currentMove, setCurrentMove] = useState(0);

  const xIsNext = currentMove % 2 === 0;
  const currentSquares = history[currentMove];

  // Resto de la lógica aquí...

  return { history, currentMove, xIsNext, currentSquares, handlePlay, jumpTo };
}
```

### 3. **Optimizaciones de Rendimiento**

Implementa `React.memo` para `Square` y posiblemente para `Board` para evitar re-renderizados innecesarios cuando sus props no cambian. Aunque este juego es simple, estas prácticas son útiles en proyectos más grandes.

### 4. **Mejora de la Accesibilidad**

Asegúrate de que tu aplicación sea accesible. Esto podría incluir la adición de atributos `aria-*` relevantes y garantizar que el juego sea jugable completamente con el teclado.

### 5. **Uso de Contexto para el Estado del Juego**

Para un juego más complejo o si planeas añadir características que requieren compartir el estado del juego entre varios componentes, considera usar el Contexto de React para evitar el "prop drilling" excesivo.

### 6. **Mejoras en la Estructura del Código**

- Utiliza desestructuración de objetos en los parámetros de las funciones para mejorar la legibilidad.
- Emplea operadores de propagación para simplificar la copia de objetos o arrays.

### 7. **Styling Avanzado**

Considera usar CSS-in-JS con bibliotecas como styled-components o Emotion para un control más fino sobre los estilos y para aprovechar las ventajas de JavaScript para manejar los estilos basados en el estado.

### 8. **Testing**

Añade pruebas unitarias y de integración. Podrías usar Jest junto con React Testing Library para probar la lógica del juego y la interacción del usuario. Asegúrate de cubrir casos como el manejo de turnos, la determinación del ganador, y la funcionalidad de "viaje en el tiempo".

### 9. **Documentación**

Comenta tu código donde sea necesario para explicar la lógica compleja o decisiones de diseño importantes. También podrías considerar añadir un archivo `README.md` con instrucciones sobre cómo ejecutar y probar tu aplicación, así como una descripción general de la arquitectura y las decisiones de diseño.

Refactorizar el código con estas sugerencias no solo mejora la calidad y mantenibilidad de tu proyecto, sino que también te prepara mejor para trabajar en aplicaciones React más grandes y complejas, manteniendo las mejores prácticas de desarrollo en mente.