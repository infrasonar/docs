# InfraSonar documentation

This is the repository for the InfraSonar documentation. It makes use of [MkDocs](https://www.mkdocs.org/) and the [Material](https://squidfunk.github.io/mkdocs-material/) theme.

---

## Installation

### Local

Installing the required pip packages:

```bash
pip install -r requirements.txt
```

Start the server:

```bash
mkdocs serve
```

### Docker

The following commands build the site and start the server on http://127.0.0.1:8000
Observe we overwrite the path with our local path, this allows for live updates while making modifications to the site.

```bash
docker build -t infrasonardocs .
docker run --rm --volume="$PWD:/usr/src/app" -p 8000:8000 infrasonardocs
```

## Editing

* [Find supported emojis](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/)


## Deploying

Building should be done by creating a new version tag. This will trigger a gh-action which executes `mkdocs gh-deploy`.

```bash
git tag v0.1.0
git push origin v0.1.0
```
