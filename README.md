# README

This README documents the necessary steps to get the application up and running in development and production environments.

# School Management

## Description

The aim of this project is to create a **Ruby on Rails** application with a REST API, a PostgreSQL database, and background jobs for processing notifications.

---

## Getting Started

### Prerequisites

Ensure you have the following dependencies installed:

* **IDE**: RubyMine 2024.1 or later [download](https://www.jetbrains.com/ruby/download/)
* **Ruby**: Version 3.2 or later [official doc](https://www.ruby-lang.org/en/documentation/installation/)
* **Rails**: Version 7.1 or later [official doc](https://rubyonrails.org/)
* **PostgreSQL**: Version 14 or later [official doc](https://www.postgresql.org/download/)
* **Git**: Version 2.47.1 or later [official doc](https://git-scm.com/)

### Configuration

Install dependencies:
````shell
bundle install
````


Set up the database:
````shell
rails db:create db:migrate
````

### Database Seeding

To populate the database with initial data (users, courses, etc.):
````shell
rails db:seed
````

### User Authentication

After seeding the database, you can log in with the following demo accounts:

#### Dean Account
- **Email**: pierre.lambert@ecole.fr
- **Password**: password

#### Teacher Account
- **Email**: jacques.martin@ecole.fr
- **Password**: password

#### Student Account
- **Email**: thomas.dubois@ecole.fr
- **Password**: password

---

## Development Environment

### Running the application

Start the Rails server:
````shell
rails server
````

The server will be available at [http://127.0.0.1:3000](http://127.0.0.1:3000)

To watch for Tailwind CSS changes (if applicable):
````shell
rails tailwindcss:watch
````

To run background jobs using Sidekiq:
````shell
bundle exec sidekiq
````

---

## Production Deployment

### Setting up the production environment

1. Ensure the database is set up:
````shell
RAILS_ENV=production rails db:create db:migrate
````
2. Seed the production database (if needed):
````shell
RAILS_ENV=production rails db:seed
````
3. Precompile assets:
````shell
RAILS_ENV=production rails assets:precompile
````
4. Start the server (e.g., using Puma):
````shell
RAILS_ENV=production bundle exec puma -C config/puma.rb
````
5. Run background workers (if applicable):
````shell
RAILS_ENV=production bundle exec sidekiq
````

### Docker Deployment (Optional)
If using Docker, build and run the container:
````shell
docker build -t project-name .
docker run -p 3000:3000 project-name
````

---

## Directory Structure

````shell
├── Dockerfile                  # Docker configuration
├── Gemfile                     # Ruby dependencies
├── Gemfile.lock
├── README.md                   # Documentation
├── Rakefile
├── app                         # Application files
│   ├── assets
│   ├── controllers
│   ├── helpers
│   ├── javascript
│   ├── jobs
│   ├── mailers
│   ├── models
│   └── views
├── bin
├── config                      # Configuration files
├── db                          # Database migrations
├── docs
├── lib
├── public
├── script
├── storage
├── test                        # Test suite
└── vendor
````

---

## Collaboration

* Workflow
  * [Gitflow](https://www.atlassian.com/fr/git/tutorials/comparing-workflows/gitflow-workflow)
  * [How to commit](https://www.conventionalcommits.org/en/v1.0.0/)
  * [Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)

* Propose new features in [GitHub Issues](https://github.com/YourOrganization/YourProject/issues)
* Pull requests should be merged into the **develop** branch.
* Releases are done using GitFlow.
* Issues should be reported on the [GitHub Issues page](https://github.com/YourOrganization/YourProject/issues)

### Commit Conventions

* [How to commit](https://www.conventionalcommits.org/en/v1.0.0/)
```bash
<type>(<scope>): <subject>
```

- **build**: Changes that affect dependencies or the build system.
- **ci**: CI/CD configuration or workflow changes.
- **feat**: Adding a new feature.
- **fix**: Bug fixes.
- **perf**: Performance improvements.
- **refactor**: Code restructuring without changing behavior.
- **style**: Code style changes (formatting, linting, etc.).
- **docs**: Documentation updates.
- **test**: Adding or modifying tests.

Examples:
```bash
feat(users): add user authentication system
````
```bash
fix(posts_controller): fix post sorting issue
````

---

## License
The project is released under a [MIT license](https://mit-license.org/)

---

## Contact

* If needed, you can create an issue on GitHub, and we will respond as soon as possible.

