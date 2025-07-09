import Domino from './Domino';

export default function Player({ position, dominoes, faceUp = false }) {
  const orientation = (position === 'left' || position === 'right') ? 'vertical' : 'horizontal';
  const containerClass = `dominoes-container ${orientation === 'horizontal' ? 'horizontal' : 'vertical'}`;

  return (
    <div className={containerClass}>
      {dominoes?.map((domino, index) => (
        <Domino
          key={index}
          leftValue={domino[0]}
          rightValue={domino[1]}
          faceUp={faceUp}
          orientation={orientation}
        />
      ))}
    </div>
  );
}