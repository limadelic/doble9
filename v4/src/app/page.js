'use client';

export default function Home() {
  const renderHorizontalDominoes = (count) => {
    return Array.from({length: count}, (_, i) => (
      <div key={i} style={{
        backgroundImage: 'url(/img/back_ver.gif)',
        backgroundSize: 'cover',
        backgroundRepeat: 'no-repeat',
        marginRight: '1px',
        width: '50px',
        height: '100px',
        float: 'left',
        display: 'block'
      }}></div>
    ));
  };

  const renderVerticalDominoes = (count) => {
    return Array.from({length: count}, (_, i) => (
      <div key={i} style={{
        backgroundImage: 'url(/img/back_hor.gif)',
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
          width: '510px',
          padding: '10px'
        }}>
          {renderHorizontalDominoes(10)}
        </div>
      </div>
    </div>
  );
}
