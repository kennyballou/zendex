# Zendex
[![Build Status](https://travis-ci.org/shdblowers/zendex.svg?branch=master)](https://travis-ci.org/shdblowers/zendex)
[![Coverage Status](https://coveralls.io/repos/github/shdblowers/zendex/badge.svg?branch=master)](https://coveralls.io/github/shdblowers/zendex?branch=master)
[![Hex.pm version](http://img.shields.io/hexpm/v/zendex.svg?style=flat)](https://hex.pm/packages/zendex)
[![Hex.pm downloads](https://img.shields.io/hexpm/dt/zendex.svg?style=flat)](https://hex.pm/packages/zendex)
[![Hex.pm license](https://img.shields.io/hexpm/l/zendex.svg?style=flat)](https://github.com/shdblowers/zendex/blob/master/LICENSE)
[![Libraries.io dependencies](https://img.shields.io/librariesio/release/hex/zendex.svg?style=flat)](https://libraries.io/hex/zendex)

An Elixir wrapper for the Zendesk API.

## Installation

  1. Add `zendex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:zendex, "~> 0.5.0"}]
    end
    ```

  2. Ensure `zendex` is started before your application:

    ```elixir
    def application do
      [applications: [:zendex]]
    end
    ```
