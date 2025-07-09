import {useState, useCallback} from 'react';
import _ from 'lodash';

export default function useGame() {

    const [state, setState] = useState({});

    const dominoes = () =>
        _.chain(10)
            .times(x => _.range(x, 10)
                .map(y => ({left: x, right: y})))
            .flatten()
            .shuffle()
            .value();

    const players = () =>
        _(['top', 'left', 'right', 'player'])
            .zipObject(_.chunk(dominoes(), 10))
            .value();

    const start = useCallback(() => {
        setState({
            table: [],
            players: players()
        });
    }, []);

    return {...state, start};
}