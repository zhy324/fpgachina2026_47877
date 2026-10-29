# ==========================================
# RGB 灯控制 (基于 J4 接口 AR0, AR1, AR2)
# ==========================================
set_property PACKAGE_PIN T14 [get_ports {rgb_led_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_led_tri_o[0]}]

set_property PACKAGE_PIN U12 [get_ports {rgb_led_tri_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_led_tri_o[1]}]

set_property PACKAGE_PIN U13 [get_ports {rgb_led_tri_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_led_tri_o[2]}]

# ==========================================
# 板载按键控制 (BTN0, BTN1)
# ==========================================
set_property PACKAGE_PIN D19 [get_ports {buttons_tri_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {buttons_tri_i[0]}]

set_property PACKAGE_PIN D20 [get_ports {buttons_tri_i[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {buttons_tri_i[1]}]