class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    print "#{name} azaza #{count}"
  end
end