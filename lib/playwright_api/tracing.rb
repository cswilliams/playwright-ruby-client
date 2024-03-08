module Playwright
  #
  # API for collecting and saving Playwright traces. Playwright traces can be opened in [Trace Viewer](../trace-viewer.md) after Playwright script runs.
  #
  # Start recording a trace before performing actions. At the end, stop tracing and save it to a file.
  #
  # ```python sync
  # browser = chromium.launch()
  # context = browser.new_context()
  # context.tracing.start(screenshots=True, snapshots=True)
  # page = context.new_page()
  # page.goto("https://playwright.dev")
  # context.tracing.stop(path = "trace.zip")
  # ```
  class Tracing < PlaywrightApi

    #
    # Start tracing.
    #
    # **Usage**
    #
    # ```python sync
    # context.tracing.start(name="trace", screenshots=True, snapshots=True)
    # page = context.new_page()
    # page.goto("https://playwright.dev")
    # context.tracing.stop(path = "trace.zip")
    # ```
    def start(
          name: nil,
          screenshots: nil,
          snapshots: nil,
          sources: nil,
          title: nil)
      wrap_impl(@impl.start(name: unwrap_impl(name), screenshots: unwrap_impl(screenshots), snapshots: unwrap_impl(snapshots), sources: unwrap_impl(sources), title: unwrap_impl(title)))
    end

    #
    # Start a new trace chunk. If you'd like to record multiple traces on the same `BrowserContext`, use [`method: Tracing.start`] once, and then create multiple trace chunks with [`method: Tracing.startChunk`] and [`method: Tracing.stopChunk`].
    #
    # **Usage**
    #
    # ```python sync
    # context.tracing.start(name="trace", screenshots=True, snapshots=True)
    # page = context.new_page()
    # page.goto("https://playwright.dev")
    #
    # context.tracing.start_chunk()
    # page.get_by_text("Get Started").click()
    # # Everything between start_chunk and stop_chunk will be recorded in the trace.
    # context.tracing.stop_chunk(path = "trace1.zip")
    #
    # context.tracing.start_chunk()
    # page.goto("http://example.com")
    # # Save a second trace file with different actions.
    # context.tracing.stop_chunk(path = "trace2.zip")
    # ```
    def start_chunk(name: nil, title: nil)
      wrap_impl(@impl.start_chunk(name: unwrap_impl(name), title: unwrap_impl(title)))
    end

    #
    # Stop tracing.
    def stop(path: nil)
      wrap_impl(@impl.stop(path: unwrap_impl(path)))
    end

    #
    # Stop the trace chunk. See [`method: Tracing.startChunk`] for more details about multiple trace chunks.
    def stop_chunk(path: nil)
      wrap_impl(@impl.stop_chunk(path: unwrap_impl(path)))
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
