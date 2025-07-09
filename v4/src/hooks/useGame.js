import { useCallback, useState } from 'react';
import _ from 'lodash';
import { arrange } from '../services/player';

export default function useGame() {
    const [state, setState] = useState({});
    const [arranging, setArranging] = useState(false);

    const dominoes = () =>
        _.chain(10)
            .times(x => _.range(x, 10).map(y => [x, y]))
            .flatten()
            .shuffle()
            .value();

    const players = async () => 
        _(['top', 'left', 'right', 'player'])
            .zipObject(_.chunk(dominoes(), 10))
            .value();

    const start = useCallback(async () => {
        const dominoes = await players();
        setState({
            table: [],
            players: dominoes
        });
        
        setArranging(true);
        arrange(dominoes.player).then(sorted => {
            setState(prev => ({ ...prev, players: { ...prev.players, player: sorted } }));
            setArranging(false);
        });
    }, []);

    return { ...state, start, arranging };
}