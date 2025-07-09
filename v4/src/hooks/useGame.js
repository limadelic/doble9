import {useState, useCallback} from 'react';
import _ from 'lodash';

export default function useGame() {

    const [state, setState] = useState({});

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
        setState({
            table: [],
            players: await players()
        });
    }, []);

    return {...state, start};
}