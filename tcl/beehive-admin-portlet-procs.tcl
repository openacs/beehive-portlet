ad_library {

    Procedures to support the beehive portlet.

    @creation-date 2004-04-10
    @author Aiman turani (aimant@mm.st)
    @cvs-id $Id$

}

namespace eval beehive_admin_portlet {

    ad_proc -private get_my_name {
    } {
        return "beehive_admin_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "Beehive Administration"
    }

    ad_proc -private my_package_key {
    } {
        return "beehive-portlet"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Adds a beehive  mgt admin PE to the given admin portal. There should only
        ever be one of these portals on an admin page with only one beehive_package_id

        @param portal_id The page to add self to
        @param package_id the id of the beehive package

        @return element_id The new element's id
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id
        ]
    }

    ad_proc -public remove_self_from_page {
        portal_id
    } {
        Removes a beehive  admin PE from the given portal
    } {
        portal::remove_element -portal_id $portal_id -portlet_name [get_my_name]
    }

    ad_proc -public show {
        cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "beehive-admin-portlet"
    }

}
