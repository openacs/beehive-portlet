ad_page_contract {

    The logic for the aiman.

    @author Aiman turani (aiman@mm.st)
    @creation-date 2004-04-10
    @cvs-id $Id$

} -query {
} -properties {
         session:multirow
         info:multirow
}

array set config $cf

set list_of_package_ids $config(package_id)
set package_idn [lindex $list_of_package_ids 0]

# package_id gives the instance of the application needed to get community name 
set package_id [ad_conn package_id]

set community_id [dotlrn_community::get_community_id -package_id $package_id]
set comm_name [dotlrn_community::get_community_name_not_cached $community_id]
set admin_id [dotlrn_community::list_admin_users $community_id]
set user_id [ad_conn user_id]

set shaded_p $config(shaded_p)
set list_of_package_ids [lsort $config(package_id)]

set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]
set name [acs_user::get_element -user_id $user_id -element name]

set fflag 0
db_multirow session get_info "SELECT * from beehive_ses where classname = :comm_name order by number"
template::multirow foreach session {
set fflag 1	
}


set url [parameter::get -package_id $package_idn -parameter "systemURL"]
set flashservera [parameter::get -package_id $package_idn -parameter "FlashComServer"]
ad_return_template 
