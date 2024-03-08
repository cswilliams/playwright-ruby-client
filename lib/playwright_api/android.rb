module Playwright
  #
  # Playwright has **experimental** support for Android automation. This includes Chrome for Android and Android WebView.
  #
  # *Requirements*
  # - Android device or AVD Emulator.
  # - [ADB daemon](https://developer.android.com/studio/command-line/adb) running and authenticated with your device. Typically running `adb devices` is all you need to do.
  # - [`Chrome 87`](https://play.google.com/store/apps/details?id=com.android.chrome) or newer installed on the device
  # - "Enable command line on non-rooted devices" enabled in `chrome://flags`.
  #
  # *Known limitations*
  # - Raw USB operation is not yet supported, so you need ADB.
  # - Device needs to be awake to produce screenshots. Enabling "Stay awake" developer mode will help.
  # - We didn't run all the tests against the device, so not everything works.
  #
  # *How to run*
  #
  # An example of the Android automation script would be:
  #
  # Note that since you don't need Playwright to install web browsers when testing Android, you can omit browser download via setting the following environment variable when installing Playwright:
  #
  # ```bash js
  # PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm i -D playwright
  # ```
  class Android < PlaywrightApi

    #
    # This methods attaches Playwright to an existing Android device.
    # Use [`method: Android.launchServer`] to launch a new Android server instance.
    def connect(wsEndpoint, headers: nil, slowMo: nil, timeout: nil)
      raise NotImplementedError.new('connect is not implemented yet.')
    end

    #
    # Returns the list of detected Android devices.
    def devices(host: nil, omitDriverInstall: nil, port: nil)
      wrap_impl(@impl.devices(host: unwrap_impl(host), omitDriverInstall: unwrap_impl(omitDriverInstall), port: unwrap_impl(port)))
    end

    #
    # This setting will change the default maximum time for all the methods accepting `timeout` option.
    def set_default_timeout(timeout)
      raise NotImplementedError.new('set_default_timeout is not implemented yet.')
    end
    alias_method :default_timeout=, :set_default_timeout

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
