import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :xtbfront, XtbfrontWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "v5Ql5o+MHJ8VgjoON4Nh9TP/Rg7IqgrMKTy9W/WMiicw0tYovAD+Q6kYp+R4Fk4J",
  server: false

# In test we don't send emails.
config :xtbfront, Xtbfront.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
