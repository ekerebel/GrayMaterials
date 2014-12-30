jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  account.setupForm()

account =
  setupForm: ->
    $('#new_account').submit ->
      $('input[type=submit]').attr('disabled', true)
      Stripe.bankAccount.createToken($('#new_account'), account.handleStripeResponse)
      false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_account').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_account')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)