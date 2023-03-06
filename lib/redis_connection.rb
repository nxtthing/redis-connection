module RedisConnection
  module_function

  def with(&)
    pool.with(&)
  end

  def pool
    @pool ||= ConnectionPool.new(size: ENV.fetch("RAILS_MAX_THREADS", 5).to_i + 3) { ::Redis.new }
  end

  def pool_wrapper
    @pool_wrapper ||= ConnectionPool::Wrapper.new(pool:)
  end
end
