defmodule FutureMade.Core do
  use Commanded.Application, otp_app: :future_made

    # register router in the core.
  router FutureMade.Core.CommandRouter

end
