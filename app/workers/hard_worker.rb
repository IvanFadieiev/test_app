class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    p "#{name} azaza #{count}"
  end
end