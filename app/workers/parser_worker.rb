class ParserWorker
  include Sidekiq::Worker
  def perform
    Parser.new.run
  end
end