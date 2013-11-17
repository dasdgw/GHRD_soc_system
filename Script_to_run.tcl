vsim -voptargs=+acc soc_system.soc_system_led_pio
add wave sim:/soc_system_led_pio/*
force -freeze sim:/soc_system_led_pio/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/soc_system_led_pio/reset_n 0 0
run 100
force -freeze sim:/soc_system_led_pio/reset_n 1 0
force -freeze sim:/soc_system_led_pio/chipselect 1 0
force -freeze sim:/soc_system_led_pio/write_n 0 0
# 
force -freeze sim:/soc_system_led_pio/writedata 11111111111111111111111111111111 0
force -freeze sim:/soc_system_led_pio/address 11 0
run 1000
# not needed add wave -r /*
force -freeze sim:/soc_system_led_pio/address 00 0
run 1000
run 200
force -freeze sim:/soc_system_led_pio/writedata 010101111111111111111111111111111 0
run 200
force -freeze sim:/soc_system_led_pio/writedata 10101111111111111111111111110101 0
run 200
force -freeze sim:/soc_system_led_pio/writedata 11111111111111111111111111110101 0
run 200
force -freeze sim:/soc_system_led_pio/writedata 11111111111111111111111111110111 0
run 200
