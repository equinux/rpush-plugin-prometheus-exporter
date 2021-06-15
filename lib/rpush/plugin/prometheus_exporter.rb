require "prometheus_exporter/client"

plugin = Rpush.plugin(:prometheus_exporter)
plugin.url = "https://github.com/equinux/rpush-plugin-prometheus-exporter"
plugin.description = "Rpush plugin to send stats to prometheus_exporter."

plugin.configure do |config|
  config.host = "localhost"
  config.port = 9394
end

REFLECTIONS = [:error, :apns_feedback, :notification_enqueued, :notification_delivered,
               :notification_failed, :notification_id_failed, :notification_will_retry,
               :notification_id_will_retry, :tcp_connection_lost, :gcm_delivered_to_recipient,
               :gcm_failed_to_recipient, :gcm_invalid_registration_id, :adm_failed_to_recipient]

plugin.reflect do |on|
  REFLECTIONS.each do |reflection|
    block = ->(*args) { @counter.observe(1, event: reflection.to_s) }
    on.send(reflection, &block)
  end
end

plugin.init do
  PrometheusExporter::Metric::Base.default_prefix = "rpush"
  @client = PrometheusExporter::Client.new(
    host: plugin.config.host,
    port: plugin.config.port,
  )
  @counter = @client.register(:counter, "rpush", "Rpush event counter")
end
