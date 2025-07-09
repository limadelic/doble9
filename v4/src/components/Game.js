import Player from './Player';
import useGame from '../hooks/useGame';

export default function Game() {
  const { players } = useGame();
  return (
    <div className="game-container">
      <div className="player-area top">
        <Player 
          position="top" 
          dominoes={players.top} 
          faceUp={false} 
        />
      </div>
      
      <table className="game-table">
        <tbody>
          <tr>
            <td className="table-cell vertical">
              <Player 
                position="left" 
                dominoes={players.left} 
                faceUp={false} 
              />
            </td>
            <td className="table-cell main">
              <div className="table-center"></div>
            </td>
            <td className="table-cell vertical">
              <Player 
                position="right" 
                dominoes={players.right} 
                faceUp={false} 
              />
            </td>
          </tr>
        </tbody>
      </table>
      
      <div className="player-area bottom">
        <Player 
          position="bottom" 
          dominoes={players.bottom} 
          faceUp={true} 
        />
      </div>
    </div>
  );
}