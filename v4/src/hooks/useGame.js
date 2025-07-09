import { useState } from 'react';

export default function useGame() {
  const generateDominoes = (count) => {
    return Array.from({ length: count }, (_, i) => ({
      left: Math.floor(i / 2),
      right: i % 7
    }));
  };

  const [players] = useState({
    top: generateDominoes(10),
    left: generateDominoes(10),
    right: generateDominoes(10),
    bottom: generateDominoes(10)
  });

  return { players };
}