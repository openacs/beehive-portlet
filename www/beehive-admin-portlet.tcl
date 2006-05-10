ad_page_contract {

    The logic for the aiman.

    @author  turani
    @creation-date 2004-04-10
    @cvs-id $Id$

} -query {
} -properties {
         sess:multirow
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



set class $comm_name
set name [acs_user::get_element -user_id $user_id -element name]

# list down the created session 
set url [lindex [site_node::get_url_from_object_id -object_id $package_idn] 0] 
db_multirow sess get_info "SELECT * from beehive_ses where classname = :comm_name order by number"


set flag [parameter::get -package_id $package_idn -parameter "firstTimeFlage"]
if {$flag == 0 } {
set surl [parameter::set_value  -package_id $package_idn -parameter "systemURL" -value [ad_url]]
set new [parameter::set_value  -package_id $package_idn -parameter "firstTimeFlage" -value 1]
}

ad_return_template 
