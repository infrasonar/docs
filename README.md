# InfraSonar documentation

This is the repository for the InfraSonar documentation. It makes use of [MkDocs](https://www.mkdocs.org/) and the [Material](https://squidfunk.github.io/mkdocs-material/) theme.

---

## Installation

Installing the required pip packages:

```bash
pip install -r requirements.txt
```

---

## Running

```bash
mkdocs serve
```

or using Docker:

```bash
docker build -t infrasonardocs .
docker run --rm -p 8000:8000 infrasonardocs
```

Alternative:
```
docker run --rm --volume="$PWD:/docs" --publish 8000:8000 squidfunk/mkdocs-material
```

## Editing

* [search for emojis](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/)
---

## Deploying

Building should be done by creating a new version tag. This will trigger a gh-action which executes `mkdocs gh-deploy`.

```bash
git tag v0.1.0
git push origin v0.1.0
```
