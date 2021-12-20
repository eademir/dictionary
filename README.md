# DICTIONARY

Dictionary is an improvable flutter project to see words' definitions, phonetics, examples and more.

## Usage

- First of all, you will need an **API key** from [**Oxford Dictionaries**](https://developer.oxforddictionaries.com).
- You must create a **.env file** in **root directory (/)** of project.
- Add your id, url and key values in it.

    __e.g.__
    > ID = '#######'
    > URL = 'https://od-api.oxforddictionaries.com/api/v2'
    > KEY = '###############'

- Build and use it where you want.

## Tests

- ### UI Test

There is no any bug but a glitch. Sometimes, when app is launched or theme is changed, app needs to route another page to implement to new theme fully. Namely, UI may not be able to render some parts on time.

- ### Video

[![App Video](https://img.youtube.com/vi/fqn9NecNjuE/0.jpg)](https://www.youtube.com/watch?v=fqn9NecNjuE)

- ### Implementation Test

Dictionary is tested on web, Android and macOS. App just needs internet permission. Only if app connects internet can it work on any platform except web. API requests is not working for web. I am still looking for this issue.

---

## ISSUE

IF you need any help, just let me now. You can open a new issue from *[here](https://github.com/eademir/dictionary/issues)*, though.
