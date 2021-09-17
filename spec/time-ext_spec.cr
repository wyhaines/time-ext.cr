require "./spec_helper"

describe Time do
  it "returns the total seconds and nanoseconds that represents a Time value" do
    now = Time.utc
    now.should eq Time.new(seconds: now.internal_seconds, nanoseconds: now.internal_nanoseconds, location: Time::Location.local)
  end

  # This is a really lame spec.
  it "returns the nanoseconds since the unix epoch" do
    (Time.utc.nanoseconds_since_unix_epoch > 1631903150035791360).should be_true
  end
end
