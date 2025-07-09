import { exec } from 'child_process';

export function ask(message) {
    return new Promise((resolve) => {
        exec(`echo "${message}" | claude`, (error, stdout) => {
            resolve(error ? error.message : stdout.trim());
        });
    });
}