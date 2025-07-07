'use client';

export default function Home() {
  const renderHorizontalDominoes = (count, faceUp = false) => {
    return Array.from({length: count}, (_, i) => {
      if (faceUp) {
        const top = Math.floor(i / 2);
        const bottom = i % 7;
        return (
          <div key={i} style={{
            marginRight: '1px',
            width: '50px',
            height: '100px',
            float: 'left',
            display: 'flex',
            flexDirection: 'column',
            backgroundSize: 'cover',
            backgroundRepeat: 'no-repeat',
            backgroundColor: 'white',
            border: '1px solid black',
            borderRadius: '4px'
          }}>
            <div style={{
              padding: '5px',
              width: '40px',
              height: '45px',
              borderBottom: '1px solid #ccc',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}>
              <img src={`/img/${top}.gif`} style={{maxWidth: '30px', maxHeight: '30px'}} />
            </div>
            <div style={{
              padding: '5px',
              width: '40px',
              height: '45px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}>
              <img src={`/img/${bottom}.gif`} style={{maxWidth: '30px', maxHeight: '30px'}} />
            </div>
          </div>
        );
      } else {
        return (
          <div key={i} style={{
            backgroundImage: 'url(/img/domino_back.png)',
            backgroundSize: 'cover',
            backgroundRepeat: 'no-repeat',
            marginRight: '1px',
            width: '50px',
            height: '100px',
            float: 'left',
            display: 'block',
            borderRadius: '4px'
          }}></div>
        );
      }
    });
  };

  const renderVerticalDominoes = (count) => {
    return Array.from({length: count}, (_, i) => (
      <div key={i} style={{
        backgroundImage: 'url(/img/domino_back_hor.png)',
        backgroundSize: 'cover',
        backgroundRepeat: 'no-repeat',
        marginBottom: '1px',
        height: '50px',
        width: '100px',
        display: 'block'
      }}></div>
    ));
  };

  return (
    <div style={{height: '100vh', position: 'relative'}}>
      <div style={{
        position: 'fixed',
        top: '0',
        width: '100%',
        zIndex: 10
      }}>
        <div style={{
          margin: 'auto',
          width: '510px',
          padding: '10px'
        }}>
          {renderHorizontalDominoes(10)}
        </div>
      </div>
      
      <table style={{width: '100%', height: '100%', borderCollapse: 'collapse', margin: 0, padding: 0}}>
        <tr>
          <td style={{width: '100px', verticalAlign: 'middle'}}>
            <div style={{
              margin: 'auto',
              height: '510px',
              width: '100px',
              padding: '10px'
            }}>
              {renderVerticalDominoes(10)}
            </div>
          </td>
          <td style={{width: 'auto', textAlign: 'center', verticalAlign: 'middle'}}>
            <div style={{padding: '20px', minHeight: '300px'}}></div>
          </td>
          <td style={{width: '100px', verticalAlign: 'middle'}}>
            <div style={{
              margin: 'auto',
              height: '510px',
              width: '100px',
              padding: '10px'
            }}>
              {renderVerticalDominoes(10)}
            </div>
          </td>
        </tr>
      </table>
      
      <div style={{
        position: 'fixed',
        bottom: '0',
        width: '100%',
        zIndex: 10
      }}>
        <div style={{
          margin: 'auto',
          width: '530px',
          padding: '10px'
        }}>
          {renderHorizontalDominoes(10, true)}
        </div>
      </div>
    </div>
  );
}
