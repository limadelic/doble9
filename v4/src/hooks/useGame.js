import {useState, useCallback, useEffect, useRef} from 'react';
import _ from 'lodash';

export default function useGame() {

    const [state, setState] = useState({});
    const sortedRef = useRef(false);

    const dominoes = () =>
        _.chain(10)
            .times(x => _.range(x, 10)
                .map(y => [x, y]))
            .flatten()
            .shuffle()
            .value();

    const players = async () => {
        const playerDominoes = _(['top', 'left', 'right', 'player'])
            .zipObject(_.chunk(dominoes(), 10))
            .value();
        
        
        return playerDominoes;
    };

    const start = useCallback(async () => {
        sortedRef.current = false;
        setState({
            table: [],
            players: await players()
        });
    }, []);

    useEffect(() => {
        if (state.players?.player && !sortedRef.current) {
            sortedRef.current = true;
            const message = `Sort these dominoes: ${JSON.stringify(state.players.player)}. Return ONLY the JSON array, no other text.`;
            
            fetch('/api/claude', {
                method: 'POST',
                body: message
            })
            .then(res => res.text())
            .then(sortedResponse => {
                try {
                    const jsonMatch = sortedResponse.match(/\[\[.*?\]\]/);
                    const jsonStr = jsonMatch ? jsonMatch[0] : sortedResponse;
                    const sortedDominoes = JSON.parse(jsonStr);
                    setState(prev => ({
                        ...prev,
                        players: {
                            ...prev.players,
                            player: sortedDominoes
                        }
                    }));
                } catch (e) {
                    console.error('Sort failed:', e);
                }
            });
        }
    }, [state.players]);

    return {...state, start};
}