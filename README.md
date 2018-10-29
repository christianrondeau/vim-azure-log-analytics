# Vim Azure Log Analytics

Run [Azure Application Insights (Log Analytics)](https://docs.loganalytics.io/index) queries .

# Installation

## Requirements

* [jq](https://stedolan.github.io/jq/)
* [cURL](https://curl.haxx.se/)
  * On Windows, you may need to download https://curl.haxx.se/ca/cacert.pem as `curl-ca-bundle.crt` and put it somewhere available in your `PATH`

## Plugin

Use your preferred Vim plugin installation method. If you like [vim-plug](https://github.com/junegunn/vim-plug):

Add to your `.vimrc`:

    Plug 'christianrondeau/vim-azure-log-analytics'

And install it:

    :PlugInstall

## Basic Configuration

You also need to assign these variables in your `.vimrc`:

    let g:azureloganalytics_appid = ""
    let g:azureloganalytics_apikey = ""

You can select between different formattings too:

    let g:azureloganalytics_format = "text"

Supported formattings are:

    * `json` (default): Array of objects
    * `csv`: Comma-separated values
    * `text`: Human readable output

# Usage

* Open a buffer with a `kql` file type (e.g. `:enew query.kql`)
* Type a [Azure Log Analytics](https://docs.loganalytics.io/docs/Language-Reference) query
* Press enter

# LICENSE

Copyright (c) 2018 Christian Rondeau, under [MIT license](LICENSE)
