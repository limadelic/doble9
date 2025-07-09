import { useState, useCallback } from 'react';

export default function useGame() {
  const generateDominoes = () => {
    const dominoes = [];
    for (let x = 0; x <= 9; x++) {
      for (let y = x; y <= 9; y++) {
        dominoes.push({ left: x, right: y });
      }
    }
    return dominoes;
  };

  const shuffle = (array) => {
    const shuffled = [...array];
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    return shuffled;
  };

  const [gameState, setGameState] = useState({
    all: [],
    table: [],
    top: [],
    left: [],
    right: [],
    bottom: [],
    started: false,
    winner: null,
    stucked: false
  });

  const start = useCallback(() => {
    const all = shuffle(generateDominoes());
    const players = ['top', 'left', 'right', 'bottom'];
    const newState = {
      all: all.slice(40),
      table: [],
      started: true,
      winner: null,
      stucked: false
    };

    players.forEach((player, index) => {
      newState[player] = all.slice(index * 10, (index + 1) * 10);
    });

    setGameState(newState);
  }, []);

  const play = useCallback((player, domino, head) => {
    setGameState(prev => ({
      ...prev,
      [player]: prev[player].filter(d => d !== domino),
      table: [...prev.table, { domino, head }]
    }));
  }, []);

  const canPlay = useCallback((player, tableHeads) => {
    if (!gameState[player]) return false;
    return gameState[player].some(domino => 
      tableHeads.some(head => domino.left === head || domino.right === head)
    );
  }, [gameState]);

  return {
    gameState,
    players: {
      top: gameState.top,
      left: gameState.left,
      right: gameState.right,
      bottom: gameState.bottom
    },
    start,
    play,
    canPlay,
    started: gameState.started,
    table: gameState.table
  };
}