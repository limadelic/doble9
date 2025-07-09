import {useState, useCallback} from 'react';
import _ from 'lodash';

export default function useGame() {

    const dominoes = () =>
        _.chain(10)
            .times(x => _.range(x, 10)
                .map(y => ({left: x, right: y})))
            .flatten()
            .shuffle()
            .value();

    const [state, setState] = useState({});

    const start = useCallback(() => {
        const all = dominoes();
        const players = ['top', 'left', 'right', 'bottom'];
        const newState = {
            all: all.slice(40),
            table: [],
            started: true,
            winner: null,
            stucked: false
        };

        players.forEach((player, index) => {
            newState[player] = all.slice(index * 10, (index + 1) * 10);
        });

        setState(newState);
    }, []);

    const play = useCallback((player, domino, head) => {
        setState(prev => ({
            ...prev,
            [player]: prev[player].filter(d => d !== domino),
            table: [...prev.table, {domino, head}]
        }));
    }, []);

    const canPlay = useCallback((player, tableHeads) => {
        return !state[player] ? false :
            state[player].some(domino =>
                tableHeads.some(head => domino.left === head || domino.right === head)
            );
    }, [state]);

    return {
        players: {
            top: state.top,
            left: state.left,
            right: state.right,
            bottom: state.bottom
        },
        start,
        play,
        canPlay,
        started: state.started,
        table: state.table
    };
}