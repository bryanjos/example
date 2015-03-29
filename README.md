# Example

Example Phoenix Project showing off Elixir to JavaScript and interoperability with other JavaScript libraries. This should be continuosly updated as development of the ex_to_js library continues.

The code in `web/static/exjs` with the `.exjs` extension are the ElixirJS files. They are converted to JavaScript and placed in `priv/static/js`. 

There is a gulp task set up specifically for it `gulp build-exjs` if you want to look at how it's done in a gulp task.

Requirements:

  * gulp `npm install -g gulp`
  * jspm `npm install -g jspm`

Instructions:

1. Install dependencies with `mix deps.get`
2. Install node dependencies with `npm install`
3. Install jspm dependencies with `jspm install`
4. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.
