# MinifyResponse

The `MinifyResponse.HTML` plug takes care of minifying the response body when the response content type is text/html.

## Installation

Add `minify_response` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:minify_response, "~> 0.1.0"}]
end
```

## Usage

```elixir
plug MinifyResponse.HTML
```
