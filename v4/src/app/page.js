export default function Home() {
  const renderHorizontalDominoes = (count, faceUp = false) => {
    return Array.from({length: count}, (_, i) => {
      if (faceUp) {
        const top = Math.floor(i / 2);
        const bottom = i % 7;
        return (
          <div key={i} className="domino horizontal face-up">
            <div className="domino-half top">
              <img src={`/img/${top}.gif`} />
            </div>
            <div className="domino-half">
              <img src={`/img/${bottom}.gif`} />
            </div>
          </div>
        );
      } else {
        return (
          <div key={i} className="domino horizontal face-down"></div>
        );
      }
    });
  };

  const renderVerticalDominoes = (count) => {
    return Array.from({length: count}, (_, i) => (
      <div key={i} className="domino vertical face-down"></div>
    ));
  };

  return (
    <div className="game-container">
      <div className="player-area top">
        <div className="dominoes-container horizontal">
          {renderHorizontalDominoes(10)}
        </div>
      </div>
      
      <table className="game-table">
        <tr>
          <td className="table-cell vertical">
            <div className="dominoes-container vertical">
              {renderVerticalDominoes(10)}
            </div>
          </td>
          <td className="table-cell main">
            <div className="table-center"></div>
          </td>
          <td className="table-cell vertical">
            <div className="dominoes-container vertical">
              {renderVerticalDominoes(10)}
            </div>
          </td>
        </tr>
      </table>
      
      <div className="player-area bottom">
        <div className="dominoes-container">
          {renderHorizontalDominoes(10, true)}
        </div>
      </div>
    </div>
  );
}
