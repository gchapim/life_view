defmodule LifeWeb.PageLiveTest do
  use LifeWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "render", %{conn: conn} do
    assert {:ok, page_live, _html} = live(conn, "/")

    Enum.each(0..6, fn x_el ->
      Enum.each(0..6, fn y_el ->
        assert has_element?(page_live, "#grid-#{x_el}-#{y_el}")
      end)
    end)

    assert has_element?(page_live, "#grid-2-1.alive")
    assert has_element?(page_live, "#grid-2-2.alive")
    assert has_element?(page_live, "#grid-2-3.alive")

    Process.sleep(20)
    assert has_element?(page_live, "#grid-1-2.alive")
    assert has_element?(page_live, "#grid-2-2.alive")
    assert has_element?(page_live, "#grid-3-2.alive")
  end

  test "resets state", %{conn: conn} do
    assert {:ok, page_live, _html} = live(conn, "/")

    Process.sleep(30)
    assert has_element?(page_live, "#grid-1-2.alive")
    assert has_element?(page_live, "#grid-2-2.alive")
    assert has_element?(page_live, "#grid-3-2.alive")

    Process.sleep(20)

    render(page_live)
    assert has_element?(page_live, "#grid-2-1.alive")
    assert has_element?(page_live, "#grid-2-2.alive")
    assert has_element?(page_live, "#grid-2-3.alive")
  end
end
