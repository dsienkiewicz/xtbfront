# Xtbfront

Xtbfront is a sample UI using [XtbClient](https://github.com/dsienkiewicz/xtb_client_ex).
The main goal was to show how to use library features to build a simple application.

## Demo

To see a demo of the application go to [Demo website](https://xtbfrontdemo.viska.eu/).

## Local development

To start a backend server:

* make a copy of `./back/xtbfront/.sample-env` as `./back/xtbfront/.env`
* replace env placeholders with proper values. Paragraph about obtaining credentials to XTB: [XTB credentials](#xtb-credentials).
* run command

```bash
cd ./back/xtbfront
mix deps.get
mix phx.server
```

To start a frontend part:

```bash
cd ./front
npm install
npm run dev
```

After running front-end and back-end parts, they should be available at 
http://localhost:8000 for the front-end and
http://localhost:4000/api for the back-end part.

## Docker

It is also possible to run the application as Docker containers with `docker-compose`.
To start the whole stack:

* make a copy of `./.sample_xtbfront-api-env` as `./.xtbfront-api.env`
* replace env placeholders with proper values. Apart from XTB credentials described in [XTB credentials](#xtb-credentials) you might need to put a secret key for Phoenix application.
To get it run `mix phx.gen.secret` inside `./back/xtbfront` folder.
* run command

```bash
docker-compose -f docker-compose.dev.yml up -d --build
```

## XTB credentials

If you don't have an account on XTB platform, go to [XTB website](https://www.xtb.com/en/demo-account) to create one.
After validating your e-mail you should get an account number.
Account number and password are needed to put them in `.env` files for proper communication with XTB server.