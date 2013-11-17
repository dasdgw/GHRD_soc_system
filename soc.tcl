set my_service_path [ lindex [ get_service_paths master ] 0 ]
open_service master $my_service_path
set x 0
while {$x <100} {
	master_write_8 $my_service_path 0x10040 0x0f
	after 100
	master_write_8 $my_service_path 0x10040 0x0e
	after 100
	master_write_8 $my_service_path 0x10040 0x0d	
	after 100
	master_write_8 $my_service_path 0x10040 0x0b
	after 100
	master_write_8 $my_service_path 0x10040 0x07
	after 100
	set x [expr {$x + 1}]
	}