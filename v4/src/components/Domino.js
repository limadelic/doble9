export default function Domino({ leftValue = 0, rightValue = 0, faceUp = false, orientation = 'horizontal' }) {
  if (!faceUp) {
    return <div className={`domino ${orientation} face-down`}></div>;
  }

  return (
    <div className={`domino ${orientation} face-up`}>
      <div className="domino-half top">
        <img src={`/img/${leftValue}.gif`} alt={`${leftValue} dots`} />
      </div>
      <div className="domino-half">
        <img src={`/img/${rightValue}.gif`} alt={`${rightValue} dots`} />
      </div>
    </div>
  );
}