import { ask } from '../../../services/claude';

export async function POST(request) {
    const message = await request.text();
    const response = await ask(message);
    return new Response(response);
}