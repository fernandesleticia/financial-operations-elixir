# Financial Operations Elixir

## Setup
  * Install dependencies
  ```bash
  $ mix deps.get
  ```

  * Configure your database in `config/dev.exs` and `config/test.exs`

  * Create and migrate your database:
  ```bash
  $ mix ecto.setup
  ```

  * Install Node.js dependencies
  ```bash
  $ cd assets && npm install
  ```

  * Run your app inside IEx (Interactive Elixir)
  ```bash
  $ iex -S mix phx.server
  ```

## Test
  * Run the tests
  ```bash
  $ mix test
  ```

## Deploy
Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Mananging the style
  * format the code base
  ```bash
  $ mix format
  ```
  * run `credo`
  ```bash
  $ mix credo
  ```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
