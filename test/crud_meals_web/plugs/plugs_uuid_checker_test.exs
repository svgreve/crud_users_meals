defmodule CrudMealsWeb.Plugs.UUIDCheckerTest do
  use ExUnit.Case

  alias CrudMealsWeb.Plugs.UUIDChecker

  describe "init/1" do
    test "when initialized with options, return the given options" do
      options = %{parm1: 1}
      assert  UUIDChecker.init(options) == options
    end

  end

end
