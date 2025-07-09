import Player from './Player';
import useGame from '../hooks/useGame';
import { useEffect } from 'react';

export default function Game() {
  const { players, start, arranging } = useGame();
  
  useEffect(() => {
    start();
  }, [start]);

  return (
    <div className="game-container">
      <div className="player-area top">
        <Player 
          position="top" 
          dominoes={players?.top} 
          faceUp={false} 
        />
      </div>
      
      <table className="game-table">
        <tbody>
          <tr>
            <td className="table-cell vertical">
              <Player 
                position="left" 
                dominoes={players?.left} 
                faceUp={false} 
              />
            </td>
            <td className="table-cell main">
              <div className="table-center"></div>
            </td>
            <td className="table-cell vertical">
              <Player 
                position="right" 
                dominoes={players?.right} 
                faceUp={false} 
              />
            </td>
          </tr>
        </tbody>
      </table>
      
      <div className="player-area player">
        {arranging && (
          <div style={{
            position: 'absolute',
            top: '15px',
            left: '50%',
            transform: 'translateX(-255px)',
            zIndex: 20
          }}>
            <img 
              src="/claude-logo.svg" 
              alt="Claude logo" 
              style={{
                width: '32px',
                height: '32px',
                animation: 'spin 1s linear infinite'
              }}
            />
          </div>
        )}
        <Player 
          position="player" 
          dominoes={players?.player} 
          faceUp={true} 
        />
      </div>
    </div>
  );
}