module Playwright
  #
  # The Mouse class operates in main-frame CSS pixels relative to the top-left corner of the viewport.
  #
  # Every `page` object has its own Mouse, accessible with [`property: Page.mouse`].
  #
  # ```python sync
  # # using ‘page.mouse’ to trace a 100x100 square.
  # page.mouse.move(0, 0)
  # page.mouse.down()
  # page.mouse.move(0, 100)
  # page.mouse.move(100, 100)
  # page.mouse.move(100, 0)
  # page.mouse.move(0, 0)
  # page.mouse.up()
  # ```
  class Mouse < PlaywrightApi

    #
    # Shortcut for [`method: Mouse.move`], [`method: Mouse.down`], [`method: Mouse.up`].
    def click(
          x,
          y,
          button: nil,
          clickCount: nil,
          delay: nil)
      wrap_impl(@impl.click(unwrap_impl(x), unwrap_impl(y), button: unwrap_impl(button), clickCount: unwrap_impl(clickCount), delay: unwrap_impl(delay)))
    end

    #
    # Shortcut for [`method: Mouse.move`], [`method: Mouse.down`], [`method: Mouse.up`], [`method: Mouse.down`] and
    # [`method: Mouse.up`].
    def dblclick(x, y, button: nil, delay: nil)
      wrap_impl(@impl.dblclick(unwrap_impl(x), unwrap_impl(y), button: unwrap_impl(button), delay: unwrap_impl(delay)))
    end

    #
    # Dispatches a `mousedown` event.
    def down(button: nil, clickCount: nil)
      wrap_impl(@impl.down(button: unwrap_impl(button), clickCount: unwrap_impl(clickCount)))
    end

    #
    # Dispatches a `mousemove` event.
    def move(x, y, steps: nil)
      wrap_impl(@impl.move(unwrap_impl(x), unwrap_impl(y), steps: unwrap_impl(steps)))
    end

    #
    # Dispatches a `mouseup` event.
    def up(button: nil, clickCount: nil)
      wrap_impl(@impl.up(button: unwrap_impl(button), clickCount: unwrap_impl(clickCount)))
    end

    #
    # Dispatches a `wheel` event.
    #
    # **NOTE**: Wheel events may cause scrolling if they are not handled, and this method does not
    # wait for the scrolling to finish before returning.
    def wheel(deltaX, deltaY)
      wrap_impl(@impl.wheel(unwrap_impl(deltaX), unwrap_impl(deltaY)))
    end
  end
end
