module Time::KHExt
  VERSION = "1.0.0"

  # Return the total nanoseconds since the Unix epoch.
  def nanoseconds_since_unix_epoch
    (self - Time::UNIX_EPOCH).total_nanoseconds.to_u64
  end

  # For no good reason that I can discern, Time doesn't expose the internal
  # seconds/nanoseconds representation.
  # There are protected methods to get it, but we want it, so let's just add
  # a couple very simple public getters to access that information.

  @[AlwaysInline]
  # Return the number of seconds since the epoch for this Time instance.
  def internal_seconds
    @seconds
  end

  @[AlwaysInline]
  # Return the number of nanoseconds in the current second for this Time instance.
  def internal_nanoseconds
    @nanoseconds
  end
end

struct Time
  include Time::KHExt
end
