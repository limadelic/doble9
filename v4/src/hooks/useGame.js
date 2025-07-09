import { useCallback, useEffect, useState } from 'react';
import _ from 'lodash';
import { arrange } from '../services/player';

export default function useGame() {
    const [state, setState] = useState({});

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
        setState({
            table: [],
            players: await players()
        });
    }, []);

    useEffect(() => {
        arrange(state.players?.player).then(sorted => 
            setState(prev => ({ ...prev, players: { ...prev.players, player: sorted } }))
        );
    }, [state.players?.player]);

    return { ...state, start };
}