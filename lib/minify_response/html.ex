defmodule MinifyResponse.HTML do
  alias MinifyResponse.HTML

  def init(opts \\ []), do: opts

  def call %Plug.Conn{} = conn, _ \\ [] do
    Plug.Conn.register_before_send(conn, &HTML.minify_body/1)
  end

  def minify_body(%Plug.Conn{} = conn) do
    case List.keyfind(conn.resp_headers, "content-type", 0) do
      {_, "text/html" <> _} ->
        body = conn.resp_body
               |> Floki.parse
               |> Floki.raw_html

        %Plug.Conn{conn | resp_body: body}
      _ ->
        conn
    end
  end
end
