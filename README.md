# Decap CMS Tester

A repository for testing various scenarios when developing Decap CMS

## Installing

You need Hugo installed on your machine: <https://gohugo.io/getting-started/quick-start/>

This repository is set up to be developed with [Visual Studio Code](https://code.visualstudio.com/) editor. Please install reccommended extensions listed in [extensions.json](.vscode/extensions.json)

If this is your first time running the project, run

`npm install` and `npx husky install`

When you have that run one of these commands for local dev server:

`hugo server` or `npm run dev`

and open your local site on http://localhost:1313/

## Testing Decap local build

In this project (decap-cms-tester): 

* Run `npx decap-server`

In decap-cms project:

* Run `npm run start`
* Add `local_backend = true` to `dev-test/config.toml`

Open `http://localhost:8080/` in your browser. You should see the admin panel with config from decap-cms project. All changes will be saved to this project's folders. This also works with any other project on which you might run `npx decap-server` with these steps.

## Built With

* [Hugo](https://gohugo.io/)
* [Decap CMS](https://decapcms.org/)
