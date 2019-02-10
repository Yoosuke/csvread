# Csvread

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `csvread` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:csvread, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/csvread](https://hexdocs.pm/csvread).

Example
index.html.eex
<%
[head | tail] = Csvread.stream("zip_utf8.csv")
res = Csvread.csv_struct(head, tail)
columns = res.columns
recode = Csvread.map(res)
%>

<table border="1">
<tr>
<%= for column <- columns do %>
<th><%= column %></th>
<% end %>
</tr>
<%= for recode_row <- recode do %>
<tr>
<%= for column <- columns do %>
<td><%= Map.get(recode_row,column) %></td>
<% end %>
</tr>
<% end %>
</table>
