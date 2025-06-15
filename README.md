# local-github-pages
Set up an environment to preview your [github-pages](https://pages.github.com/) locally

Unlike the half-baked guide on [official docs](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll), this repository provides a "setup once, use anywhere" environment for previewing github pages locally.

The generated preview closely matches GitHub's deployment runner, with negligible differences in a few <!--{% raw %}--> `{{ site.github }}` <!--{% endraw %}--> values. All page themes and plugins listed in [github pages dependencies](https://pages.github.com/versions/) come bundled with the initial setup. This includes QoL plugins such as `jekyll-github-metadata`, `jekyll-optional-front-matter`, etc.

While most plugins in the list are loaded by default on github pages, some need to be explicitly enabled via the `plugins:` list in `_config.yml`.

## Initial Setup
1. Make sure `ruby`, `gem` and `bundler` are installed
	```bash
	sudo apt install ruby ruby-dev build-essential
	```
	```bash
	gem install bundler
	```
	(or download from [ruby-lang.org](https://www.ruby-lang.org/en/downloads/))
2. Clone this repo, then run bundler to install dependencies locally
	```bash
	bundle install
	```
3. **Optional:** Copy [`example.env`](example.env) to `.env` and edit the values. This step deals with repo naming and github API calls
	```bash
	cp example.env .env
	```

## Usage
To start the local server for preview, run jekyll with [`--source` flag](https://jekyllrb.com/docs/configuration/options/#global-configuration) with the path to your repo directory:
```bash
bundler exec jekyll serve --livereload --source ../your/repo/path
```

Or use [`runserver.sh`](runserver.sh) which is a simple wrapper around the long command:
```bash
./runserver.sh ../your/repo/path
```
The path defaults to the current directory if not specified.

> [!Important]\
> For resolving the repo name and github metadata variables, `.env` needs to be configured as mentioned in [step 3](#initial-setup) of the setup.
>
> **NEVER commit your API tokens to the public!**

## Updating Version
To update to the latest Github Pages version, run bundler's update command:
```bash
bundler update github-pages
```

For further information or troubleshooting, refer to the documentation on [Github Pages gem](https://github.com/github/pages-gem).
