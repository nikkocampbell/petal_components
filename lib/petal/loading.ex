defmodule PetalComponents.Loading do
  use Phoenix.Component

  # prop size, :string, default: "sm", values: ["button", "sm", "md", "lg"]
  # prop class, :css_class, default: ""
  # prop show, :boolean, default: true
  def spinner(assigns) do
    ~H"""
    <svg
      class={get_spinner_classes(assigns)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
    >
      <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" />
      <path
        class="opacity-75"
        fill="currentColor"
        d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
      />
    </svg>
    """
  end

  defp get_spinner_classes(assigns) do
    base_classes = "animate-spin -ml-1"
    custom_classes = assigns[:class] || ""
    show_class = if assigns[:show], do: "", else: "hidden"
    size_classes = get_size_classes(assigns[:size])

    Enum.join(
      [
        base_classes,
        custom_classes,
        show_class,
        size_classes
      ],
      " "
    )
  end

  def get_size_classes("button"), do: "-ml-0.5 mr-2 h-4 w-4"
  def get_size_classes("sm"), do: "h-5 w-5"
  def get_size_classes("md"), do: "h-8 w-8"
  def get_size_classes("lg"), do: "h-16 w-16"
  def get_size_classes(_), do: "h-8 w-8"
end
