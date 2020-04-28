## About
  
  Application built with elixir that performs financial operations with money within the same currency.
  the system performs: 
  * The split of financial transactions
  * The exchange through a currency conversion operation.
  * Validation for compliance with ISO 4217

## Technologies
  The application is built with:
  * Elixir `1.10.2`, elixir official website: https://elixir-lang.org/
  * Phoenix `1.4.11` , phoenix official website: http://www.phoenixframework.org/

## Dependencies
  * credo `~> 1.3` , found it at: https://github.com/rrrene/credo
  * bcrypt_elixir, `~> 2.0`, found it at: https://github.com/riverrun/bcrypt_elixir
  * poison, '~> 4.0', found it at: https://github.com/devinus/poison
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
## Mananging the style
  * format the code base
  ```bash
  $ mix format
  ```
  * run `credo`
  ```bash
  $ mix credo
  ```

## Test
  * Run the tests
  ```bash
  $ mix test
  ```
  * Get the test coverage
  ```bash
  $ mix test --cover
  ``` 
## Using
  * creating an user in IEx:
  ```bash
  $ FinancialOperationsElixir.Auth.create_user(%{email: "asd@asd.com", password: "qwerty"})
  ``` 
## Deploy
Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Releases
  * 

## License

## Credits

