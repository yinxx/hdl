
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

## The following HDL projects supports all the devices of EVAL-AD40XX-FMCZ:
##
##  AD4000/AD4001/AD4002/AD4003/AD4004/AD4005/AD4006/AD4007/AD4008/AD4010/AD4011/AD4020
##
## NOTE: Make sure that you set up your required ADC resolution and sampling rate
##       in system_bd.tcl
##
## For more information see http://www.analog.com/en/products/analog-to-digital-converters/precision-adc-20msps/single-channel-ad-converters/ad4000.html

adi_project_xilinx ad400x_zed

adi_project_files ad400x_zed [list \
    "$ad_hdl_dir/library/xilinx/common/ad_iobuf.v" \
    "system_top.v" \
    "system_constr.xdc" \
    "$ad_hdl_dir/projects/common/zed/zed_system_constr.xdc"]

adi_project_run ad400x_zed

