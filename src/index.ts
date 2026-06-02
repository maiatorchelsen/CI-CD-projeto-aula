import express, { Request, Response } from 'express';


const app = express();
const port = Number(process.env.PORT) || 3000;

app.get('/', (_req: Request, res: Response) => {
	res.status(200).send('OK');
});

app.listen(port, () => {
	// eslint-disable-next-line no-console
	console.log(`Servidor rodando na porta ${port}`);
});
