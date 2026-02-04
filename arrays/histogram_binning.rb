# We’ve determined a risk score on incoming verified people.
# We’d like to visualize this population.
# To visualize, we’re going to make a histogram.
#
# Histogram (0,100,5)
# --------------
#   [0,20):13
#   [20,40):21
#   [40,60):13
#   [60,80):9
#   [80,100):4
#
# Histogram (0,100,5)
# --------------
# [0-20): xxxxxxxxxxxxx
# [20-40): xxxxxxxxxxxxxxxxxxxxx
# [40-60): xxxxxxxxxxxxx
# [60-80): xxxxxxxxx
# [80-100): xxxx
#--------------------------------
# - parameters
#   - inclusive lower bound
#   - exclusive upper bound
#   - number of buckets (each bucket has the same width)
# 
# - methods
#   - add_data_point(number) -> increase the value of the bucket where number occurs
#   - bucket_value(bucket_index) -> value of bucket at index `bucket_index`(number of data points in that bucket)
# 
# - What I'm looking for
#   - working code
#   - performance is NOT important
#   - tests
#   - hearing your thought process along the way
# [execution time limit] 4 seconds (rb)
# [memory limit] 2g
#
# Considerations:
#
# 1. array
#
# Time:
# - add_data_point: O(n)
# - bucket_value: O(1)
# Space: O(n) = Number of buckets
# - Traverse / Iterate through all the buckets to
# - Be able to find which one of the values that belongs to
# - Smaller number of buckets
#
# 2. Better performance
#
# - add_data_point: O(1)
# - bucket_value: O(1)
# Space: O(k): Number of buckets
# --------------------------------

class Histogram
    def initialize(min, max, num_buckets)
        @min = min
        @max = max
        @num_buckets = num_buckets
        @bucket_width = (max - min).to_f / num_buckets
        @buckets = [0] * num_buckets

        # raises ArgumentError when max <= min
        # raises ArgumentError when num_buckets <= 0
    end

    def bucket_value(bucket_index)
        @buckets[bucket_index]
    end
    
    # display the histogram
    def display
        @num_buckets.times do |i|
            bucket_start = @min + (i * @bucket_width)
            bucket_end = @min + ((i+1) * @bucket_width)
            
            count = @buckets[i]
            
            # format the range
            range = "[#{bucket_start}-#{bucket_end})"
            bars = 'x' * count
            
            puts "#{range}: #{bars}"           
        end
    end

    # 1. context: happy path = with valid values
    # 1.1. ability to add a value to a correct bucket
    # 1.2. check increment the bucket count with multiple values
    # 1.3. make sure the distribution values across the multiple buckets
    # 1.4. Checks if floating point is being handled correctly
    
    def add_data_point(value)
        @num_buckets.times do |i|
            bucket_start = @min + (@bucket_width * i)
            bucket_end = @min + ((i + 1) * @bucket_width)
            if value >= bucket_start && value < bucket_end
                @buckets[i] += 1
                return
            end
        end
    end

    def add_fast_data_point(value)
        bucket_index = ((value - @min) / @bucket_width).floor
        @buckets[bucket_index] += 1
    end
    
    # 2. context: boundary values
    # 2.1. make sure we are including the min value (inclusive upper bound)
    # 2.2. make sure the maximum value is being excluded (exclusive upper bound)
    # 2.3. be able to place bucket boundary values in the next bucket
    # 2.4. be able to handle the values just below the bucket boundaries
    
    # 3. context: with out-of-range values
    # 3.1. ignores values below min
    # 3.2. we should only count values within range
    # 3.3. any values that are above max should be ignored
end

h = Histogram.new(0, 100, 5)
h.add_data_point(0)
h.add_fast_data_point(0)
h.display
