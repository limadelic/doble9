import { exec } from 'child_process';

export async function POST(request) {
    const message = await request.text();
    return new Promise((resolve) => {
        exec(`echo "${message}" | claude`, (error, stdout) => {
            resolve(new Response(error ? error.message : stdout.trim()));
        });
    });
}