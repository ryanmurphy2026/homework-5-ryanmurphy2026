# Agents.md — TodoApp (homework-5)

## Stack

- Ruby **3.4.1** (`.ruby-version`, `Dockerfile`)
- Rails **~> 8.1.3** with `config.load_defaults 8.0` (`Gemfile`, `config/application.rb`)
- App module: **TodoApp** (`config/application.rb`)
- Database: **SQLite3** under `storage/`; production uses separate SQLite DBs for primary, cache, queue, and cable (`Gemfile`, `config/database.yml`)
- Web server: **Puma** (`Gemfile`, `config/puma.rb`)
- Assets: **Propshaft** — not Sprockets/webpack (`Gemfile`)
- JavaScript: **importmap-rails** + **Turbo** + **Stimulus** — no `package.json` (`Gemfile`, `config/importmap.rb`)
- JSON API views: **Jbuilder** (`Gemfile`, `app/views/todos/*.jbuilder`)
- Production infra: **solid_cache**, **solid_queue**, **solid_cable** (SQLite-backed) (`Gemfile`, `config/environments/production.rb`)
- Deploy: **Docker** + **Kamal** + **Thruster** (`Dockerfile`, `config/deploy.yml`, `bin/kamal`, `bin/thrust`)
- Auth: not configured (`bcrypt` commented out in `Gemfile`)

## Commands

- Setup: `bin/setup` (bundle, `db:prepare`, clear logs/tmp; may start server) (`bin/setup`)
- Dev server: `bin/dev` → `bin/rails server` (`bin/dev`)
- Tests (match CI): `RAILS_ENV=test bin/rails db:test:prepare test test:system` (`.github/workflows/ci.yml`)
- Lint: `bin/rubocop -f github` (`.github/workflows/ci.yml`)
- Security: `bin/brakeman --no-pager`, `bin/importmap audit` (`.github/workflows/ci.yml`)
- DB: `bin/rails db:prepare` (`bin/setup`, `bin/docker-entrypoint`)

## Conventions

- Standard Rails MVC under `app/`; tests in `test/` with **Minitest** (not RSpec) (`test/test_helper.rb`)
- Routes: `resources :todos`, `get '/hello' => todos#hello`, health at `/up` (`config/routes.rb`)
- Strong params use Rails 8 **`params.expect`** — only `:description` permitted today (`app/controllers/todos_controller.rb`)
- Validation failures use **`:unprocessable_content`** (`app/controllers/todos_controller.rb`)
- Schema changes via **`db/migrate/`** only; `db/schema.rb` is generated (`db/schema.rb`)
- Fixtures: `test/fixtures/todos.yml`; `fixtures :all` in `test/test_helper.rb`
- Tests run in parallel: `parallelize(workers: :number_of_processors)` (`test/test_helper.rb`)
- System tests: headless Chrome via Capybara/Selenium (`test/application_system_test_case.rb`)
- Lint style: **RuboCop Rails Omakase** (`.rubocop.yml`, `Gemfile`)
- Layout loads importmap + Propshaft stylesheet `:app` (`app/views/layouts/application.html.erb`)
- `Todo` has `description` and `due_date`; model method `due_today?` exists (`app/models/todo.rb`, `db/schema.rb`)

## Do not

- Commit or paste secrets: `config/master.key`, `.env*`, raw credentials in `.kamal/secrets` (`.gitignore`, `.cursorignore`, `.kamal/secrets`)
- Hand-edit **`db/schema.rb`** — use migrations (`db/schema.rb`)
- Point test DB at dev/production paths (`config/database.yml`)
- Rely on persistent data in the test database (`config/environments/test.rb`)
- Add **npm/webpack/vite** as the primary JS pipeline — use importmap (`config/importmap.rb`)
- Add **PostgreSQL/MySQL/Redis** as required dependencies — app is SQLite + Solid* (`Gemfile`, `config/database.yml`, `.github/workflows/ci.yml`)
- Use **`Dockerfile`** for local dev — it is production-only (`Dockerfile`)
- Uncomment or add gems (e.g. `bcrypt`) unless the task requires them (`Gemfile`)
- Change system-test UI strings without updating `test/system/todos_test.rb`
- Skip **`test:system`** when validating like CI (`.github/workflows/ci.yml`)
- Assume `README.md` is complete setup documentation — it is still the Rails default (`README.md`)
