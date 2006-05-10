-- /beehive-portlet/sql/postgresql/beehive-portlet-create.sql
--
-- Creates LORS Management portlet
--
-- @author Aiman truani (aimant@mm.st)
-- @creation-date 2004-04-10
-- @cvs-id $Id$
--

create function inline_0 ()
returns integer as '
declare
  ds_id 	portal_datasources.datasource_id%TYPE;
begin
	ds_id = portal_datasource__new(
        		''beehive_portlet'',
        		''Displays a Folder_id''
	);


perform  portal_datasource__set_def_param(
		ds_id,
		''t'',
		''t'',
		''shadeable_p'',
		''t''
);

perform portal_datasource__set_def_param (
		ds_id,
		''t'',
		''t'',
		''hideable_p'',
		''t''
);

perform portal_datasource__set_def_param (
		ds_id,
		''t'',
		''t'',
		''user_editable_p'',
		''f''
);

perform portal_datasource__set_def_param (
		ds_id,
		''t'',
		''t'',
		''shaded_p'',
		''f''
);

perform portal_datasource__set_def_param (
		ds_id,
		''t'',
		''t'',
		''link_hideable_p'',
		''t''
);

perform portal_datasource__set_def_param (
		ds_id,
		''t'',
		''t'',
		''style'',
		''list''
);

perform portal_datasource__set_def_param (
		ds_id,
		''t'',
		''f'',
		''package_id'',
		'' ''
);

return 0;

end; ' language 'plpgsql';

select inline_0 ();

drop function inline_0 ();

-- create the implementation
select acs_sc_impl__new(
        'portal_datasource',
        'beehive_portlet',
        'beehive_portlet'
);


-- add all the hooks
select acs_sc_impl_alias__new(
        'portal_datasource',
        'beehive_portlet',
        'GetMyName',
        'beehive_portlet::get_my_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'beehive_portlet',
        'GetPrettyName',
        'beehive_portlet::get_pretty_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'beehive_portlet',
        'Link',
        'beehive_portlet::link',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'beehive_portlet',
        'AddSelfToPage',
        'beehive_portlet::add_self_to_page',
        'TCL'
    );

select acs_sc_impl_alias__new(
        'portal_datasource',
        'beehive_portlet',
        'Show',
        'beehive_portlet::show',
        'TCL'
    );

select acs_sc_impl_alias__new(
        'portal_datasource',
        'beehive_portlet',
        'Edit',
        'beehive_portlet::edit',
        'TCL'
    );

select acs_sc_impl_alias__new(
        'portal_datasource',
        'beehive_portlet',
        'RemoveSelfFromPage',
        'beehive_portlet::remove_self_from_page',
        'TCL'
    );

    -- Add the binding
select acs_sc_binding__new (
        'portal_datasource',
        'beehive_portlet'
);

\i beehive-admin-portlet-create.sql
