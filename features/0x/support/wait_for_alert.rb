module Permissions
  module Alerts
    def wait_for_alert
      if RunLoop::Environment.ci?
        timeout = 20.0
      elsif RunLoop::Environment.xtc?
        timeout = 10.0
      else
        timeout = 4.0
      end

      message = "Waited #{timeout} seconds for an alert to appear"
      wait_for({:timeout => timeout, :timeout_message => message}) do
        alert_exists?
      end
    end

    def wait_for_alert_with_title(alert_title)
      timeout = 4
      message = "Waited #{timeout} seconds for an alert with title '#{alert_title}' to appear"

      wait_for({:timeout => timeout, :timeout_message => message}) do
        alert_exists?(alert_title)
      end
    end
  end
end

