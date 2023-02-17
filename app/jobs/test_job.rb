class TestJob < ApplicationJob
  queue_as :default

  def perform(message)
    puts "Hola estoy probando los trabajos en segundo plano"
    puts "El mensaje es #{message}"
    # Do something later
    #TestJob.perform_later("Este es el mensaje")
  end
end
