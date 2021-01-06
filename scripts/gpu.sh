prefix="nvidia-smi --format=csv --query-gpu="

# I may or may not use the following later
power_draw="power.draw"
utilization="utilization.gpu"
fan_speed="fan.speed"
temperature="temperature.gpu"
mem_free="memory.free"
mem_used="memory.used"

echo  - $($prefix$utilization | tail +2 | tr -d ' %')%
# Final pipe removes the between the value and the % symbol
