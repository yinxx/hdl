set_property ASYNC_REG TRUE [get_cells -hier -filter {name =~ *up_xfer_state*}]
set_property ASYNC_REG TRUE [get_cells -hier -filter {name =~ *d_xfer_toggle*}]
set_property ASYNC_REG TRUE [get_cells -hier -filter {name =~ *up_xfer_toggle*}]
set_property ASYNC_REG TRUE [get_cells -hier -filter {name =~ *trigger_a_d*}]
set_property ASYNC_REG TRUE [get_cells -hier -filter {name =~ *trigger_b_d*}]

set_false_path -from [get_cells -hier -filter {name =~ *d_xfer_toggle_reg   && IS_SEQUENTIAL}] -to [get_cells -hier -filter {name =~ *up_xfer_state_m1_reg   && IS_SEQUENTIAL}]
set_false_path -from [get_cells -hier -filter {name =~ *up_xfer_toggle_reg  && IS_SEQUENTIAL}] -to [get_cells -hier -filter {name =~ *d_xfer_toggle_m1_reg   && IS_SEQUENTIAL}]
set_false_path -from [get_cells -hier -filter {name =~ *up_xfer_data*       && IS_SEQUENTIAL}] -to [get_cells -hier -filter {name =~ *d_data_cntrl*          && IS_SEQUENTIAL}]
set_false_path                                                                                 -to [get_cells -hier -filter {name =~ *trigger_a_d1_reg*      && IS_SEQUENTIAL}]
set_false_path                                                                                 -to [get_cells -hier -filter {name =~ *trigger_b_d1_reg*      && IS_SEQUENTIAL}]
set_false_path                                                                                 -to [get_cells -hier -filter {name =~ *up_triggered_d1*       && IS_SEQUENTIAL}]
set_false_path                                                                                 -to [get_cells -hier -filter {name =~ *up_triggered_reset_d1* && IS_SEQUENTIAL}]

