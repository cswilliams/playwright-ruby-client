module Playwright
  #
  # Selectors can be used to install custom selector engines. See [extensibility](../extensibility.md) for more
  # information.
  class Selectors < PlaywrightApi

    #
    # Selectors must be registered before creating the page.
    #
    # **Usage**
    #
    # An example of registering selector engine that queries elements based on a tag name:
    #
    # ```python sync
    # from playwright.sync_api import sync_playwright
    #
    # def run(playwright):
    #     tag_selector = """
    #       {
    #           // Returns the first element matching given selector in the root's subtree.
    #           query(root, selector) {
    #               return root.querySelector(selector);
    #           },
    #           // Returns all elements matching given selector in the root's subtree.
    #           queryAll(root, selector) {
    #               return Array.from(root.querySelectorAll(selector));
    #           }
    #       }"""
    #
    #     # Register the engine. Selectors will be prefixed with "tag=".
    #     playwright.selectors.register("tag", tag_selector)
    #     browser = playwright.chromium.launch()
    #     page = browser.new_page()
    #     page.set_content('<div><button>Click me</button></div>')
    #
    #     # Use the selector prefixed with its name.
    #     button = page.locator('tag=button')
    #     # Combine it with built-in locators.
    #     page.locator('tag=div').get_by_text('Click me').click()
    #     # Can use it in any methods supporting selectors.
    #     button_count = page.locator('tag=button').count()
    #     print(button_count)
    #     browser.close()
    #
    # with sync_playwright() as playwright:
    #     run(playwright)
    # ```
    def register(name, script: nil, contentScript: nil, path: nil)
      wrap_impl(@impl.register(unwrap_impl(name), script: unwrap_impl(script), contentScript: unwrap_impl(contentScript), path: unwrap_impl(path)))
    end

    #
    # Defines custom attribute name to be used in [`method: Page.getByTestId`]. `data-testid` is used by default.
    def set_test_id_attribute(attributeName)
      raise NotImplementedError.new('set_test_id_attribute is not implemented yet.')
    end
    alias_method :test_id_attribute=, :set_test_id_attribute

    # @nodoc
    def text_id_attribute=(attribute_name)
      wrap_impl(@impl.text_id_attribute=(unwrap_impl(attribute_name)))
    end

    # -- inherited from EventEmitter --
    # @nodoc
    def off(event, callback)
      event_emitter_proxy.off(event, callback)
    end

    # -- inherited from EventEmitter --
    # @nodoc
    def once(event, callback)
      event_emitter_proxy.once(event, callback)
    end

    # -- inherited from EventEmitter --
    # @nodoc
    def on(event, callback)
      event_emitter_proxy.on(event, callback)
    end

    private def event_emitter_proxy
      @event_emitter_proxy ||= EventEmitterProxy.new(self, @impl)
    end
  end
end